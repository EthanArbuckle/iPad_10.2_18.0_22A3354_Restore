@implementation MDMParser

- (MDMParser)initWithManagingProfileIdentifier:(id)a3
{
  id v5;
  MDMParser *v6;
  MDMParser *v7;
  void *v8;
  uint64_t v9;
  CATOperationQueue *operationQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MDMParser;
  v6 = -[MDMParser init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_managingProfileIdentifier, a3);
    objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_isChaperoned = objc_msgSend(v8, "isSupervised");

    v7->_isMDM = v5 != 0;
    v9 = objc_opt_new();
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = (CATOperationQueue *)v9;

  }
  return v7;
}

- (id)_unavailableCommandsWhileLocked
{
  if (_unavailableCommandsWhileLocked_once != -1)
    dispatch_once(&_unavailableCommandsWhileLocked_once, &__block_literal_global_2);
  return (id)_unavailableCommandsWhileLocked_set;
}

void __44__MDMParser__unavailableCommandsWhileLocked__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = CFSTR("InstallProfile");
  v4[1] = CFSTR("InstallProfileSilent");
  v4[2] = CFSTR("InstallProvisioningProfile");
  v4[3] = CFSTR("RequestUnlockToken");
  v4[4] = CFSTR("SecurityInfo");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_unavailableCommandsWhileLocked_set;
  _unavailableCommandsWhileLocked_set = v2;

}

- (id)_unavailableCommandsBeforeFirstUnlock
{
  if (_unavailableCommandsBeforeFirstUnlock_once != -1)
    dispatch_once(&_unavailableCommandsBeforeFirstUnlock_once, &__block_literal_global_603);
  return (id)_unavailableCommandsBeforeFirstUnlock_set;
}

void __50__MDMParser__unavailableCommandsBeforeFirstUnlock__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = CFSTR("ManagedMediaList");
  v4[1] = CFSTR("InstallMedia");
  v4[2] = CFSTR("RemoveMedia");
  v4[3] = CFSTR("CertificateList");
  v4[4] = CFSTR("DeclarativeManagement");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_unavailableCommandsBeforeFirstUnlock_set;
  _unavailableCommandsBeforeFirstUnlock_set = v2;

}

- (id)_unavailableCommandsInLimitedAppsMode
{
  if (_unavailableCommandsInLimitedAppsMode_onceToken != -1)
    dispatch_once(&_unavailableCommandsInLimitedAppsMode_onceToken, &__block_literal_global_604);
  return (id)_unavailableCommandsInLimitedAppsMode_set;
}

void __50__MDMParser__unavailableCommandsInLimitedAppsMode__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = CFSTR("ApplyRedemptionCode");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_unavailableCommandsInLimitedAppsMode_set;
  _unavailableCommandsInLimitedAppsMode_set = v2;

}

- (id)_unavailableCommandsDuringIncompleteAccountDrivenEnrollment
{
  if (_unavailableCommandsDuringIncompleteAccountDrivenEnrollment_onceToken != -1)
    dispatch_once(&_unavailableCommandsDuringIncompleteAccountDrivenEnrollment_onceToken, &__block_literal_global_605);
  return (id)_unavailableCommandsDuringIncompleteAccountDrivenEnrollment_set;
}

void __72__MDMParser__unavailableCommandsDuringIncompleteAccountDrivenEnrollment__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = CFSTR("InviteToProgram");
  v4[1] = CFSTR("InstallApplication");
  v4[2] = CFSTR("ApplyRedemptionCode");
  v4[3] = CFSTR("InstallMedia");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_unavailableCommandsDuringIncompleteAccountDrivenEnrollment_set;
  _unavailableCommandsDuringIncompleteAccountDrivenEnrollment_set = v2;

}

- (id)unavailableCommandsDuringBuddy
{
  void *v2;
  int v3;
  uint64_t *v4;
  id v5;

  if (unavailableCommandsDuringBuddy_onceToken != -1)
    dispatch_once(&unavailableCommandsDuringBuddy_onceToken, &__block_literal_global_606);
  objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSupervised");
  v4 = &unavailableCommandsDuringBuddy_supervisedSet;
  if (!v3)
    v4 = &unavailableCommandsDuringBuddy_unsupervisedSet;
  v5 = (id)*v4;

  return v5;
}

void __43__MDMParser_unavailableCommandsDuringBuddy__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[9];
  _QWORD v9[9];

  v9[8] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v9[0] = CFSTR("ApplyRedemptionCode");
  v9[1] = CFSTR("DeviceLock");
  v9[2] = CFSTR("DisableLostMode");
  v9[3] = CFSTR("EnableLostMode");
  v9[4] = CFSTR("InstallMedia");
  v9[5] = CFSTR("InviteToProgram");
  v9[6] = CFSTR("RequestMirroring");
  v9[7] = CFSTR("UserList");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)unavailableCommandsDuringBuddy_supervisedSet;
  unavailableCommandsDuringBuddy_supervisedSet = v2;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v8[0] = CFSTR("ApplyRedemptionCode");
  v8[1] = CFSTR("DeviceLock");
  v8[2] = CFSTR("DisableLostMode");
  v8[3] = CFSTR("EnableLostMode");
  v8[4] = CFSTR("InstallApplication");
  v8[5] = CFSTR("InstallMedia");
  v8[6] = CFSTR("InviteToProgram");
  v8[7] = CFSTR("RequestMirroring");
  v8[8] = CFSTR("UserList");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)unavailableCommandsDuringBuddy_unsupervisedSet;
  unavailableCommandsDuringBuddy_unsupervisedSet = v6;

}

- (id)unavailableCommandsWhileInMDMLostMode
{
  if (unavailableCommandsWhileInMDMLostMode_onceToken != -1)
    dispatch_once(&unavailableCommandsWhileInMDMLostMode_onceToken, &__block_literal_global_607);
  return (id)unavailableCommandsWhileInMDMLostMode_set;
}

void __50__MDMParser_unavailableCommandsWhileInMDMLostMode__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = CFSTR("InviteToProgram");
  v4[1] = CFSTR("InstallApplication");
  v4[2] = CFSTR("ApplyRedemptionCode");
  v4[3] = CFSTR("InstallMedia");
  v4[4] = CFSTR("RequestMirroring");
  v4[5] = CFSTR("DeviceLock");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)unavailableCommandsWhileInMDMLostMode_set;
  unavailableCommandsWhileInMDMLostMode_set = v2;

}

- (BOOL)_platformHasPasscode
{
  return objc_msgSend(MEMORY[0x24BE2A818], "isAppleTV") ^ 1;
}

- (BOOL)_platformSupportsMirroring
{
  if ((objc_msgSend(MEMORY[0x24BE2A818], "isAppleTV") & 1) != 0
    || (objc_msgSend(MEMORY[0x24BE2A818], "isVisionDevice") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(MEMORY[0x24BE2A818], "isWatch") ^ 1;
  }
}

- (BOOL)_platformSupportsInviteToVPP
{
  if ((objc_msgSend(MEMORY[0x24BE2A818], "isAppleTV") & 1) != 0
    || (objc_msgSend(MEMORY[0x24BE2A818], "isVisionDevice") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(MEMORY[0x24BE2A818], "isWatch") ^ 1;
  }
}

- (BOOL)_platformSupportsMediaCommands
{
  if ((objc_msgSend(MEMORY[0x24BE2A818], "isAppleTV") & 1) != 0
    || (objc_msgSend(MEMORY[0x24BE2A818], "isVisionDevice") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(MEMORY[0x24BE2A818], "isWatch") ^ 1;
  }
}

- (BOOL)_platfromSupportsRedemptionCodes
{
  if ((objc_msgSend(MEMORY[0x24BE2A818], "isAppleTV") & 1) != 0
    || (objc_msgSend(MEMORY[0x24BE2A818], "isVisionDevice") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(MEMORY[0x24BE2A818], "isWatch") ^ 1;
  }
}

- (BOOL)_platformSupportsCellularPlan
{
  if ((objc_msgSend(MEMORY[0x24BE2A818], "isAppleTV") & 1) != 0
    || (objc_msgSend(MEMORY[0x24BE2A818], "isVisionDevice") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(MEMORY[0x24BE2A818], "isWatch") ^ 1;
  }
}

- (BOOL)_platformSupportsLostMode
{
  if ((objc_msgSend(MEMORY[0x24BE2A818], "isAppleTV") & 1) != 0)
    return 0;
  else
    return objc_msgSend(MEMORY[0x24BE2A818], "isVisionDevice") ^ 1;
}

- (BOOL)_platformSupportsDEP
{
  return objc_msgSend(MEMORY[0x24BE2A818], "isWatch") ^ 1;
}

- (BOOL)_platformSupportsOSUpdateManagement
{
  if ((objc_msgSend(MEMORY[0x24BE2A818], "isWatch") & 1) != 0)
    return 0;
  else
    return objc_msgSend(MEMORY[0x24BE2A818], "isVisionDevice") ^ 1;
}

- (BOOL)_platformSupportsActivationLock
{
  return objc_msgSend(MEMORY[0x24BE2A818], "isWatch") ^ 1;
}

- (BOOL)_platformSupportsApplicationFeedback
{
  return objc_msgSend(MEMORY[0x24BE2A818], "isWatch") ^ 1;
}

- (BOOL)_platformSupportsValidatingApplications
{
  return objc_msgSend(MEMORY[0x24BE2A818], "isWatch") ^ 1;
}

- (BOOL)_platformSupportsRestart
{
  if ((objc_msgSend(MEMORY[0x24BE2A818], "isWatch") & 1) != 0)
    return 0;
  else
    return objc_msgSend(MEMORY[0x24BE2A818], "isVisionDevice") ^ 1;
}

- (BOOL)_platformSupportsShutdown
{
  if ((objc_msgSend(MEMORY[0x24BE2A818], "isWatch") & 1) != 0
    || (objc_msgSend(MEMORY[0x24BE2A818], "isAppleTV") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(MEMORY[0x24BE2A818], "isVisionDevice") ^ 1;
  }
}

- (BOOL)_platformSupportsTriggerDiagnostics
{
  return objc_msgSend(MEMORY[0x24BE2A818], "isAppleTV");
}

- (BOOL)_platformSupportsClearingRestrictionsPassword
{
  if ((objc_msgSend(MEMORY[0x24BE2A818], "isWatch") & 1) != 0)
    return 0;
  else
    return objc_msgSend(MEMORY[0x24BE2A818], "isVisionDevice") ^ 1;
}

- (id)_commandSetDeviceEnrollment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  _QWORD v23[21];

  v23[20] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEF0];
  v23[0] = CFSTR("CertificateList");
  v23[1] = CFSTR("DeclarativeManagement");
  v23[2] = CFSTR("DeviceInformation");
  v23[3] = CFSTR("DeviceLock");
  v23[4] = CFSTR("EraseDevice");
  v23[5] = CFSTR("InstallApplication");
  v23[6] = CFSTR("InstallProfile");
  v23[7] = CFSTR("InstallProvisioningProfile");
  v23[8] = CFSTR("InstalledApplicationList");
  v23[9] = CFSTR("ManagedApplicationAttributes");
  v23[10] = CFSTR("ManagedApplicationConfiguration");
  v23[11] = CFSTR("ManagedApplicationList");
  v23[12] = CFSTR("ProfileList");
  v23[13] = CFSTR("ProvisioningProfileList");
  v23[14] = CFSTR("RemoveApplication");
  v23[15] = CFSTR("RemoveProfile");
  v23[16] = CFSTR("RemoveProvisioningProfile");
  v23[17] = CFSTR("Restrictions");
  v23[18] = CFSTR("SecurityInfo");
  v23[19] = CFSTR("Settings");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MDMParser _platformSupportsApplicationFeedback](self, "_platformSupportsApplicationFeedback"))
  {
    v22 = CFSTR("ManagedApplicationFeedback");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

  }
  if (-[MDMParser _platformSupportsValidatingApplications](self, "_platformSupportsValidatingApplications"))
  {
    v21 = CFSTR("ValidateApplications");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

  }
  if (-[MDMParser _platformHasPasscode](self, "_platformHasPasscode"))
  {
    v20 = CFSTR("ClearPasscode");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v8);

  }
  if (-[MDMParser _platfromSupportsRedemptionCodes](self, "_platfromSupportsRedemptionCodes"))
  {
    v19 = CFSTR("ApplyRedemptionCode");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v9);

  }
  if (-[MDMParser _platformSupportsInviteToVPP](self, "_platformSupportsInviteToVPP"))
  {
    v18 = CFSTR("InviteToProgram");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v10);

  }
  if (-[MDMParser _platformSupportsMirroring](self, "_platformSupportsMirroring"))
  {
    v17 = CFSTR("RequestMirroring");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v11);

  }
  if (-[MDMParser _platformSupportsCellularPlan](self, "_platformSupportsCellularPlan"))
  {
    v16 = CFSTR("RefreshCellularPlans");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v12);

  }
  if (-[MDMParser _platformSupportsMediaCommands](self, "_platformSupportsMediaCommands")
    || objc_msgSend(MEMORY[0x24BE2A7F0], "forceMediaCommandSupport"))
  {
    v15[0] = CFSTR("InstallMedia");
    v15[1] = CFSTR("ManagedMediaList");
    v15[2] = CFSTR("RemoveMedia");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v13);

  }
  return v5;
}

- (id)_commandSetDeviceEnrollment_once
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__MDMParser__commandSetDeviceEnrollment_once__block_invoke;
  block[3] = &unk_24EB68230;
  block[4] = self;
  if (_commandSetDeviceEnrollment_once_once != -1)
    dispatch_once(&_commandSetDeviceEnrollment_once_once, block);
  return (id)_commandSetDeviceEnrollment_once_commandSet;
}

void __45__MDMParser__commandSetDeviceEnrollment_once__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_commandSetDeviceEnrollment");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_commandSetDeviceEnrollment_once_commandSet;
  _commandSetDeviceEnrollment_once_commandSet = v1;

}

- (id)_commandSetSupervised
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  _QWORD v19[2];
  const __CFString *v20;
  _QWORD v21[4];
  const __CFString *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x24BDAC8D0];
  -[MDMParser _commandSetDeviceEnrollment](self, "_commandSetDeviceEnrollment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (-[MDMParser _platformSupportsLostMode](self, "_platformSupportsLostMode"))
  {
    v23[0] = CFSTR("EnableLostMode");
    v23[1] = CFSTR("PlayLostModeSound");
    v23[2] = CFSTR("DisableLostMode");
    v23[3] = CFSTR("DeviceLocation");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

  }
  if (-[MDMParser _platformSupportsMirroring](self, "_platformSupportsMirroring"))
  {
    v22 = CFSTR("StopMirroring");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v6);

  }
  if (-[MDMParser _platformSupportsOSUpdateManagement](self, "_platformSupportsOSUpdateManagement"))
  {
    v21[0] = CFSTR("ScheduleOSUpdate");
    v21[1] = CFSTR("ScheduleOSUpdateScan");
    v21[2] = CFSTR("AvailableOSUpdates");
    v21[3] = CFSTR("OSUpdateStatus");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v7);

  }
  if (-[MDMParser _platformSupportsDEP](self, "_platformSupportsDEP"))
  {
    v20 = CFSTR("DeviceConfigured");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v8);

  }
  if (-[MDMParser _platformSupportsActivationLock](self, "_platformSupportsActivationLock"))
  {
    v19[0] = CFSTR("ActivationLockBypassCode");
    v19[1] = CFSTR("ClearActivationLockBypassCode");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v9);

  }
  if (-[MDMParser _platformSupportsRestart](self, "_platformSupportsRestart"))
  {
    v18 = CFSTR("RestartDevice");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v10);

  }
  if (-[MDMParser _platformSupportsShutdown](self, "_platformSupportsShutdown"))
  {
    v17 = CFSTR("ShutDownDevice");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v11);

  }
  if (-[MDMParser _platformSupportsTriggerDiagnostics](self, "_platformSupportsTriggerDiagnostics"))
  {
    v16 = CFSTR("TriggerDiagnostics");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v12);

  }
  if (-[MDMParser _platformSupportsClearingRestrictionsPassword](self, "_platformSupportsClearingRestrictionsPassword"))
  {
    v15 = CFSTR("ClearRestrictionsPassword");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v13);

  }
  return v4;
}

- (id)_commandSetSupervised_once
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__MDMParser__commandSetSupervised_once__block_invoke;
  block[3] = &unk_24EB68230;
  block[4] = self;
  if (_commandSetSupervised_once_once != -1)
    dispatch_once(&_commandSetSupervised_once_once, block);
  return (id)_commandSetSupervised_once_commandSet;
}

void __39__MDMParser__commandSetSupervised_once__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_commandSetSupervised");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_commandSetSupervised_once_commandSet;
  _commandSetSupervised_once_commandSet = v1;

}

- (id)_commandSetDataSeparatedDeviceEnrollment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  -[MDMParser _commandSetDeviceEnrollment](self, "_commandSetDeviceEnrollment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = (void *)MEMORY[0x24BDBCF20];
  v8[0] = CFSTR("InviteToProgram");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minusSet:", v6);

  return v3;
}

- (id)_commandSetDataSeparatedDeviceEnrollment_once
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__MDMParser__commandSetDataSeparatedDeviceEnrollment_once__block_invoke;
  block[3] = &unk_24EB68230;
  block[4] = self;
  if (_commandSetDataSeparatedDeviceEnrollment_once_once != -1)
    dispatch_once(&_commandSetDataSeparatedDeviceEnrollment_once_once, block);
  return (id)_commandSetDataSeparatedDeviceEnrollment_once_commandSet;
}

void __58__MDMParser__commandSetDataSeparatedDeviceEnrollment_once__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_commandSetDataSeparatedDeviceEnrollment");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_commandSetDataSeparatedDeviceEnrollment_once_commandSet;
  _commandSetDataSeparatedDeviceEnrollment_once_commandSet = v1;

}

- (id)_commandSetUserEnrollment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[21];

  v9[20] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEF0];
  v9[0] = CFSTR("DeviceInformation");
  v9[1] = CFSTR("InstallApplication");
  v9[2] = CFSTR("InstalledApplicationList");
  v9[3] = CFSTR("InstallProfile");
  v9[4] = CFSTR("InstallProvisioningProfile");
  v9[5] = CFSTR("ManagedApplicationAttributes");
  v9[6] = CFSTR("ManagedApplicationConfiguration");
  v9[7] = CFSTR("ManagedApplicationFeedback");
  v9[8] = CFSTR("ManagedApplicationList");
  v9[9] = CFSTR("ProfileList");
  v9[10] = CFSTR("ProvisioningProfileList");
  v9[11] = CFSTR("RemoveApplication");
  v9[12] = CFSTR("RemoveProfile");
  v9[13] = CFSTR("RemoveProvisioningProfile");
  v9[14] = CFSTR("SecurityInfo");
  v9[15] = CFSTR("Settings");
  v9[16] = CFSTR("ValidateApplications");
  v9[17] = CFSTR("CertificateList");
  v9[18] = CFSTR("DeclarativeManagement");
  v9[19] = CFSTR("DeviceLock");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MDMParser _platformSupportsMediaCommands](self, "_platformSupportsMediaCommands")
    || objc_msgSend(MEMORY[0x24BE2A7F0], "forceMediaCommandSupport"))
  {
    v8[0] = CFSTR("InstallMedia");
    v8[1] = CFSTR("ManagedMediaList");
    v8[2] = CFSTR("RemoveMedia");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

  }
  return v5;
}

- (id)_commandSetUserEnrollment_once
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__MDMParser__commandSetUserEnrollment_once__block_invoke;
  block[3] = &unk_24EB68230;
  block[4] = self;
  if (_commandSetUserEnrollment_once_once != -1)
    dispatch_once(&_commandSetUserEnrollment_once_once, block);
  return (id)_commandSetUserEnrollment_once_commandSet;
}

void __43__MDMParser__commandSetUserEnrollment_once__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_commandSetUserEnrollment");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_commandSetUserEnrollment_once_commandSet;
  _commandSetUserEnrollment_once_commandSet = v1;

}

- (id)_commandSetSharediPad
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  -[MDMParser _commandSetSupervised](self, "_commandSetSupervised");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v10[0] = CFSTR("UserList");
  v10[1] = CFSTR("LogOutUser");
  v10[2] = CFSTR("DeleteUser");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCF20];
  v9[0] = CFSTR("ApplyRedemptionCode");
  v9[1] = CFSTR("ClearPasscode");
  v9[2] = CFSTR("ActivationLockBypassCode");
  v9[3] = CFSTR("ClearActivationLockBypassCode");
  v9[4] = CFSTR("ClearRestrictionsPassword");
  v9[5] = CFSTR("InviteToProgram");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObjectsFromArray:", v4);
  objc_msgSend(v3, "minusSet:", v7);

  return v3;
}

- (id)_commandSetSharediPad_once
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__MDMParser__commandSetSharediPad_once__block_invoke;
  block[3] = &unk_24EB68230;
  block[4] = self;
  if (_commandSetSharediPad_once_once != -1)
    dispatch_once(&_commandSetSharediPad_once_once, block);
  return (id)_commandSetSharediPad_once_commandSet;
}

void __39__MDMParser__commandSetSharediPad_once__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_commandSetSharediPad");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_commandSetSharediPad_once_commandSet;
  _commandSetSharediPad_once_commandSet = v1;

}

- (id)_allCommands
{
  void *v3;
  char v4;
  void *v5;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userMode") == 1)
  {

LABEL_4:
    -[MDMParser _commandSetSharediPad_once](self, "_commandSetSharediPad_once");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  v4 = objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad");

  if ((v4 & 1) != 0)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSupervised");

  if (v8)
  {
    -[MDMParser _commandSetSupervised_once](self, "_commandSetSupervised_once");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isUserEnrollment");

    if (v10)
    {
      -[MDMParser _commandSetUserEnrollment_once](self, "_commandSetUserEnrollment_once");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "personaID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        -[MDMParser _commandSetDataSeparatedDeviceEnrollment_once](self, "_commandSetDataSeparatedDeviceEnrollment_once");
      else
        -[MDMParser _commandSetDeviceEnrollment_once](self, "_commandSetDeviceEnrollment_once");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5;
}

- (id)_ephemeralSupervisedSettingsSet
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  -[MDMParser _supervisedSettingsSet](self, "_supervisedSettingsSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v6[0] = CFSTR("MaximumResidentUsers");
  v6[1] = CFSTR("SharedDeviceConfiguration");
  v6[2] = CFSTR("DiagnosticSubmission");
  v6[3] = CFSTR("AppAnalytics");
  v6[4] = CFSTR("PasscodeLockGracePeriod");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  objc_msgSend(v3, "removeObject:", CFSTR("AccessibilitySettings"));
  return v3;
}

- (id)_supervisedSettingsSet
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString **v5;
  uint64_t v6;
  void *v7;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[MDMParser _nonSupervisedSettingsSet](self, "_nonSupervisedSettingsSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  if (objc_msgSend(MEMORY[0x24BE2A818], "isAppleTV"))
  {
    v18 = CFSTR("DeviceName");
    v19 = CFSTR("TimeZone");
    v4 = (void *)MEMORY[0x24BDBCE30];
    v5 = &v18;
  }
  else
  {
    if (objc_msgSend(MEMORY[0x24BE2A818], "isWatch"))
    {
      v17 = CFSTR("AccessibilitySettings");
      v4 = (void *)MEMORY[0x24BDBCE30];
      v5 = &v17;
      v6 = 1;
      goto LABEL_9;
    }
    if ((objc_msgSend(MEMORY[0x24BE2A818], "isPhone") & 1) != 0
      || objc_msgSend(MEMORY[0x24BE2A818], "isPad"))
    {
      v11 = CFSTR("AccessibilitySettings");
      v12 = CFSTR("DeviceName");
      v13 = CFSTR("TimeZone");
      v14 = CFSTR("Bluetooth");
      v15 = CFSTR("SoftwareUpdateSettings");
      v16 = CFSTR("Wallpaper");
      v4 = (void *)MEMORY[0x24BDBCE30];
      v5 = &v11;
      v6 = 6;
      goto LABEL_9;
    }
    if (!objc_msgSend(MEMORY[0x24BE2A818], "isVisionDevice"))
      return v3;
    v9 = CFSTR("DeviceName");
    v10 = CFSTR("TimeZone");
    v4 = (void *)MEMORY[0x24BDBCE30];
    v5 = &v9;
  }
  v6 = 2;
LABEL_9:
  objc_msgSend(v4, "arrayWithObjects:count:", v5, v6, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  return v3;
}

- (id)_nonSupervisedSettingsSetWithUserEnrollment
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6[0] = CFSTR("ApplicationAttributes");
  v6[1] = CFSTR("ApplicationConfiguration");
  v6[2] = CFSTR("OrganizationInfo");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_nonSupervisedSettingsSet
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  const __CFString *v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCEF0];
  v10[0] = CFSTR("OrganizationInfo");
  v10[1] = CFSTR("ApplicationAttributes");
  v10[2] = CFSTR("ApplicationConfiguration");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x24BE2A818], "isPhone") & 1) != 0
    || (objc_msgSend(MEMORY[0x24BE2A818], "isPad") & 1) != 0
    || (objc_msgSend(MEMORY[0x24BE2A818], "isAppleTV") & 1) != 0
    || objc_msgSend(MEMORY[0x24BE2A818], "isVisionDevice"))
  {
    v9 = CFSTR("MDMOptions");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

  }
  if ((objc_msgSend(MEMORY[0x24BE2A818], "isPhone") & 1) != 0
    || objc_msgSend(MEMORY[0x24BE2A818], "isPad"))
  {
    v8[0] = CFSTR("DataRoaming");
    v8[1] = CFSTR("VoiceRoaming");
    v8[2] = CFSTR("PersonalHotspot");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v6);

  }
  return v4;
}

- (id)_ephemeralSupervisedSettingsSet_once
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__MDMParser__ephemeralSupervisedSettingsSet_once__block_invoke;
  block[3] = &unk_24EB68230;
  block[4] = self;
  if (_ephemeralSupervisedSettingsSet_once_once != -1)
    dispatch_once(&_ephemeralSupervisedSettingsSet_once_once, block);
  return (id)_ephemeralSupervisedSettingsSet_once_commandSet;
}

void __49__MDMParser__ephemeralSupervisedSettingsSet_once__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_ephemeralSupervisedSettingsSet");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_ephemeralSupervisedSettingsSet_once_commandSet;
  _ephemeralSupervisedSettingsSet_once_commandSet = v1;

}

- (id)_supervisedSettingsSet_once
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__MDMParser__supervisedSettingsSet_once__block_invoke;
  block[3] = &unk_24EB68230;
  block[4] = self;
  if (_supervisedSettingsSet_once_once != -1)
    dispatch_once(&_supervisedSettingsSet_once_once, block);
  return (id)_supervisedSettingsSet_once_commandSet;
}

void __40__MDMParser__supervisedSettingsSet_once__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_supervisedSettingsSet");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_supervisedSettingsSet_once_commandSet;
  _supervisedSettingsSet_once_commandSet = v1;

}

- (id)_nonSupervisedSettingsSetWithUserEnrollment_once
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__MDMParser__nonSupervisedSettingsSetWithUserEnrollment_once__block_invoke;
  block[3] = &unk_24EB68230;
  block[4] = self;
  if (_nonSupervisedSettingsSetWithUserEnrollment_once_once != -1)
    dispatch_once(&_nonSupervisedSettingsSetWithUserEnrollment_once_once, block);
  return (id)_nonSupervisedSettingsSetWithUserEnrollment_once_commandSet;
}

void __61__MDMParser__nonSupervisedSettingsSetWithUserEnrollment_once__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_nonSupervisedSettingsSetWithUserEnrollment");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_nonSupervisedSettingsSetWithUserEnrollment_once_commandSet;
  _nonSupervisedSettingsSetWithUserEnrollment_once_commandSet = v1;

}

- (id)_nonSupervisedSettingsSet_once
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__MDMParser__nonSupervisedSettingsSet_once__block_invoke;
  block[3] = &unk_24EB68230;
  block[4] = self;
  if (_nonSupervisedSettingsSet_once_once != -1)
    dispatch_once(&_nonSupervisedSettingsSet_once_once, block);
  return (id)_nonSupervisedSettingsSet_once_commandSet;
}

void __43__MDMParser__nonSupervisedSettingsSet_once__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_nonSupervisedSettingsSet");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_nonSupervisedSettingsSet_once_commandSet;
  _nonSupervisedSettingsSet_once_commandSet = v1;

}

- (id)_allSettingsItems
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  if (-[MDMParser isChaperoned](self, "isChaperoned"))
  {
    objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userMode") == 1)
      -[MDMParser _ephemeralSupervisedSettingsSet_once](self, "_ephemeralSupervisedSettingsSet_once");
    else
      -[MDMParser _supervisedSettingsSet_once](self, "_supervisedSettingsSet_once");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isUserEnrollment");

    if (v5)
      -[MDMParser _nonSupervisedSettingsSetWithUserEnrollment_once](self, "_nonSupervisedSettingsSetWithUserEnrollment_once");
    else
      -[MDMParser _nonSupervisedSettingsSet_once](self, "_nonSupervisedSettingsSet_once");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)processRequest:(id)a3 accessRights:(unint64_t)a4 assertion:(id)a5 completionBlock:(id)a6
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  MDMParser *v19;
  void *v20;
  char v21;
  NSObject *v22;
  _BOOL4 v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  int v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  int v37;
  NSObject *v38;
  const char *v39;
  int v40;
  int v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  int v46;
  NSObject *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  int v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  int v58;
  NSObject *v59;
  void *v60;
  void *v61;
  id WeakRetained;
  id v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  char v69;
  MDMParser *v70;
  unint64_t v71;
  int v72;
  char v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  char v79;
  int v80;
  char v81;
  int v82;
  int v83;
  char v84;
  int v85;
  void *v86;
  char v87;
  char v88;
  int v89;
  void *v90;
  int v91;
  id v92;
  void *v93;
  uint8_t buf[4];
  const __CFString *v97;
  __int16 v98;
  void *v99;
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = (void (**)(id, void *))a6;
  objc_msgSend(v8, "objectForKey:", CFSTR("RequestType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("RequestRequiresNetworkTether"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MDMDirtyEnrollmentStateFilePath();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fileExistsAtPath:", v13);

  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x24BE2A4D0]);
    objc_msgSend(MEMORY[0x24BDBCE70], "DMCDictionaryFromFile:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithDictionary:", v17);

  }
  else
  {
    v18 = 0;
  }
  objc_opt_class();
  v19 = self;
  if ((objc_opt_isKindOfClass() & 1) == 0 || v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("CommandFormatError"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_67;
  }
  v93 = v18;
  -[MDMParser _allCommands](self, "_allCommands");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "containsObject:", v11);

  v92 = v9;
  if ((v21 & 1) == 0)
  {
    -[MDMParser _invalidRequestTypeError:](self, "_invalidRequestTypeError:", v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  v22 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v22;
    v23 = -[MDMParser isChaperoned](self, "isChaperoned");
    v24 = CFSTR("MDM");
    if (v23)
      v24 = CFSTR("Supervised");
    *(_DWORD *)buf = 138543618;
    v97 = v24;
    v98 = 2114;
    v99 = v11;
    _os_log_impl(&dword_222CB9000, v22, OS_LOG_TYPE_DEFAULT, "Attempting to perform %{public}@ request: %{public}@", buf, 0x16u);

  }
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ClearPasscode"), v9) & 1) == 0)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("UnlockToken"));
    v22 = objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("CommandFormatError"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
      v9 = v92;
      v18 = v93;
      goto LABEL_67;
    }
  }
  v27 = MKBGetDeviceLockState();
  v28 = v27;
  v29 = 0;
  if (v27 && v27 != 3)
  {
    -[MDMParser _unavailableCommandsWhileLocked](self, "_unavailableCommandsWhileLocked");
    v22 = objc_claimAutoreleasedReturnValue();
    v29 = -[NSObject containsObject:](v22, "containsObject:", v11);
  }
  if (v28 && v28 != 3)

  if (v29)
  {
    v30 = *(NSObject **)(DMCLogObjects() + 8);
    v9 = v92;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v30, OS_LOG_TYPE_DEFAULT, "Device is locked", buf, 2u);
    }
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("NotNow"));
    v31 = objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  objc_msgSend(v93, "dirtyPersonaIDs");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "personaID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v32, "containsObject:", v34);

  if (v35)
  {
    -[MDMParser _unavailableCommandsDuringIncompleteAccountDrivenEnrollment](self, "_unavailableCommandsDuringIncompleteAccountDrivenEnrollment");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "containsObject:", v11);

    if (v37)
    {
      v38 = *(NSObject **)(DMCLogObjects() + 8);
      v9 = v92;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v39 = "Account Driven Enrollment is not done yet";
LABEL_49:
        _os_log_impl(&dword_222CB9000, v38, OS_LOG_TYPE_DEFAULT, v39, buf, 2u);
        goto LABEL_50;
      }
      goto LABEL_50;
    }
  }
  v40 = MKBDeviceUnlockedSinceBoot();
  v9 = v92;
  if (v40 != 1)
  {
    v41 = v40;
    if (v40)
    {
      v44 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v97) = v41;
        _os_log_impl(&dword_222CB9000, v44, OS_LOG_TYPE_ERROR, "MKB returned error for device unlocked since boot: %d", buf, 8u);
      }
    }
    else
    {
      -[MDMParser _unavailableCommandsBeforeFirstUnlock](self, "_unavailableCommandsBeforeFirstUnlock");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "containsObject:", v11);

      if (v43)
      {
        v38 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v39 = "Device has not unlocked since boot";
          goto LABEL_49;
        }
LABEL_50:
        +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("NotNow"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_51:
        v19 = self;
        goto LABEL_66;
      }
    }
  }
  if (+[MDMMCInterface isLimitedAppsMode](MDMMCInterface, "isLimitedAppsMode"))
  {
    -[MDMParser _unavailableCommandsInLimitedAppsMode](self, "_unavailableCommandsInLimitedAppsMode");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "containsObject:", v11);

    if (v46)
    {
      v47 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CB9000, v47, OS_LOG_TYPE_DEFAULT, "Device is in a limited apps mode", buf, 2u);
      }
      -[MDMParser _invalidRequestTypeInSingleAppModeError:](self, "_invalidRequestTypeInSingleAppModeError:", v11);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v48);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = self;
      goto LABEL_66;
    }
  }
  if ((DMCIsSetupBuddyDone() & 1) == 0)
  {
    -[MDMParser unavailableCommandsDuringBuddy](self, "unavailableCommandsDuringBuddy");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "containsObject:", v11);

    if (v50)
    {
      v38 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v39 = "Device is in Setup Assistant";
        goto LABEL_49;
      }
      goto LABEL_50;
    }
  }
  if (+[MDMFindMyUtilities isManagedLostModeActive](MDMFindMyUtilities, "isManagedLostModeActive"))
  {
    -[MDMParser unavailableCommandsWhileInMDMLostMode](self, "unavailableCommandsWhileInMDMLostMode");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "containsObject:", v11);

    if (v52)
    {
      v53 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CB9000, v53, OS_LOG_TYPE_DEFAULT, "Device is in MDM Lost Mode", buf, 2u);
      }
      v19 = self;
      -[MDMParser _invalidRequestTypeInMDMLostModeError:](self, "_invalidRequestTypeInMDMLostModeError:", v11);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v54);
      v55 = objc_claimAutoreleasedReturnValue();
      goto LABEL_65;
    }
  }
  v19 = self;
  if (v12 && objc_msgSend(v12, "BOOLValue"))
  {
    v56 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v56, OS_LOG_TYPE_DEFAULT, "Request requires network tether", buf, 2u);
    }
    if ((DMCDeviceIsNetworkTethered() & 1) == 0)
    {
      v59 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CB9000, v59, OS_LOG_TYPE_ERROR, "No network tether was found. Failing command.", buf, 2u);
      }
      -[MDMParser _notNetworkTetheredError](self, "_notNetworkTetheredError");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v60);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_51;
    }
  }
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("DeviceInformation")))
  {
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("InstallProfile")) & 1) != 0
      || objc_msgSend(v11, "isEqualToString:", CFSTR("InstallProfileSilent")))
    {
      -[MDMParser _installProfile:accessRights:](self, "_installProfile:accessRights:", v8, a4);
      v31 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    if (!-[MDMParser isChaperoned](self, "isChaperoned")
      && self->_managingProfileIdentifier
      && objc_msgSend(v11, "isEqualToString:", CFSTR("RemoveProfile")))
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("Identifier"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (v61)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v61, "isEqualToString:", self->_managingProfileIdentifier))
          {
            WeakRetained = objc_loadWeakRetained((id *)&self->_server);

            if (WeakRetained)
            {
              v63 = objc_loadWeakRetained((id *)&self->_server);
              +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "responseFromBasicResponse:", v64);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = (id)objc_msgSend(v63, "sendResponseSynchronously:outStatusCode:outError:", v65, 0, 0);

            }
            v67 = -[MDMParser _removeProfile:](self, "_removeProfile:", v8);
          }
        }
      }

      v9 = v92;
    }
    objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "isUserEnrollment");

    if ((v69 & 1) != 0)
      goto LABEL_88;
    v70 = self;
    if (-[MDMParser isChaperoned](self, "isChaperoned"))
    {
      v71 = 0x1FFFLL;
      goto LABEL_93;
    }
    v72 = objc_msgSend(v11, "isEqualToString:", CFSTR("ProfileList"));
    v71 = a4;
    if ((a4 & 1) != 0 && v72)
      goto LABEL_93;
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("InstallProfile")) & 1) != 0)
    {
      if ((a4 & 2) != 0)
        goto LABEL_93;
    }
    else
    {
      v73 = objc_msgSend(v11, "isEqualToString:", CFSTR("RemoveProfile"));
      if ((a4 & 2) != 0 && (v73 & 1) != 0)
        goto LABEL_93;
    }
    v74 = objc_msgSend(v11, "isEqualToString:", CFSTR("DeviceLock"));
    if ((a4 & 4) != 0 && v74)
      goto LABEL_93;
    v75 = objc_msgSend(v11, "isEqualToString:", CFSTR("RequestUnlockToken"));
    if ((a4 & 4) == 0 || !v75)
    {
      v76 = objc_msgSend(v11, "isEqualToString:", CFSTR("ClearPasscode"));
      if ((a4 & 4) == 0 || !v76)
      {
        v77 = objc_msgSend(v11, "isEqualToString:", CFSTR("RestartDevice"));
        if ((a4 & 4) == 0 || !v77)
        {
          v78 = objc_msgSend(v11, "isEqualToString:", CFSTR("ShutDownDevice"));
          if ((a4 & 4) == 0 || !v78)
          {
            v79 = objc_msgSend(v11, "isEqualToString:", CFSTR("EraseDevice"));
            if ((a4 & 8) == 0 || (v79 & 1) == 0)
            {
              v80 = objc_msgSend(v11, "isEqualToString:", CFSTR("CertificateList"));
              if ((a4 & 1) == 0 || !v80)
              {
                v81 = objc_msgSend(v11, "isEqualToString:", CFSTR("ProvisioningProfileList"));
                if ((a4 & 0x40) == 0 || (v81 & 1) == 0)
                {
                  v82 = objc_msgSend(v11, "isEqualToString:", CFSTR("InstallProvisioningProfile"));
                  if ((a4 & 0x80) == 0 || !v82)
                  {
                    v83 = objc_msgSend(v11, "isEqualToString:", CFSTR("RemoveProvisioningProfile"));
                    if ((a4 & 0x80) == 0 || !v83)
                    {
                      v84 = objc_msgSend(v11, "isEqualToString:", CFSTR("InstalledApplicationList"));
                      if ((a4 & 0x100) == 0 || (v84 & 1) == 0)
                      {
                        v85 = objc_msgSend(v11, "isEqualToString:", CFSTR("Restrictions"));
                        if ((a4 & 0x200) != 0 && v85)
                        {
                          if ((a4 & 0x40) == 0)
                          {
                            objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v8);
                            v86 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v86, "removeObjectForKey:", CFSTR("ProfileRestrictions"));

                            v8 = v86;
                          }
                          goto LABEL_121;
                        }
                        v87 = objc_msgSend(v11, "isEqualToString:", CFSTR("SecurityInfo"));
                        if ((a4 & 0x400) == 0 || (v87 & 1) == 0)
                        {
                          v88 = objc_msgSend(v11, "isEqualToString:", CFSTR("Settings"));
                          if ((a4 & 0x800) == 0 || (v88 & 1) == 0)
                          {
                            v89 = objc_msgSend(v11, "isEqualToString:", CFSTR("InviteToProgram"));
                            if ((a4 & 0x1000) == 0 || !v89)
                            {
                              if ((objc_msgSend(v11, "isEqualToString:", CFSTR("InstallApplication")) & 1) != 0
                                || (objc_msgSend(v11, "isEqualToString:", CFSTR("ValidateApplications")) & 1) != 0
                                || (objc_msgSend(v11, "isEqualToString:", CFSTR("ApplyRedemptionCode")) & 1) != 0
                                || (objc_msgSend(v11, "isEqualToString:", CFSTR("ManagedApplicationList")) & 1) != 0
                                || (objc_msgSend(v11, "isEqualToString:", CFSTR("RemoveApplication")) & 1) != 0
                                || (objc_msgSend(v11, "isEqualToString:", CFSTR("ManagedApplicationConfiguration")) & 1) != 0
                                || (objc_msgSend(v11, "isEqualToString:", CFSTR("ManagedApplicationAttributes")) & 1) != 0
                                || (objc_msgSend(v11, "isEqualToString:", CFSTR("ManagedApplicationFeedback")) & 1) != 0
                                || (objc_msgSend(v11, "isEqualToString:", CFSTR("InstallMedia")) & 1) != 0
                                || (objc_msgSend(v11, "isEqualToString:", CFSTR("ManagedMediaList")) & 1) != 0
                                || (objc_msgSend(v11, "isEqualToString:", CFSTR("RemoveMedia")) & 1) != 0
                                || (objc_msgSend(v11, "isEqualToString:", CFSTR("AvailableOSUpdates")) & 1) != 0
                                || (objc_msgSend(v11, "isEqualToString:", CFSTR("OSUpdateStatus")) & 1) != 0
                                || (objc_msgSend(v11, "isEqualToString:", CFSTR("ScheduleOSUpdate")) & 1) != 0)
                              {
                                if ((a4 & 0x1000) == 0)
                                  goto LABEL_147;
                              }
                              else
                              {
                                v91 = objc_msgSend(v11, "isEqualToString:", CFSTR("ScheduleOSUpdateScan"));
                                if ((a4 & 0x1000) == 0 || !v91)
                                {
LABEL_147:
                                  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RequestMirroring")) & 1) == 0
                                    && (objc_msgSend(v11, "isEqualToString:", CFSTR("RefreshCellularPlans")) & 1) == 0
                                    && (objc_msgSend(v11, "isEqualToString:", CFSTR("DeclarativeManagement")) & 1) == 0)
                                  {
                                    -[MDMParser _notAuthorizedError](self, "_notAuthorizedError");
                                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                                    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v90);
                                    v25 = (void *)objc_claimAutoreleasedReturnValue();

                                    v19 = self;
                                    goto LABEL_17;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_121:
    v9 = v92;
LABEL_88:
    v71 = a4;
    v70 = self;
LABEL_93:
    -[MDMParser _processRequest:accessRights:assertion:completionBlock:](v70, "_processRequest:accessRights:assertion:completionBlock:", v8, v71, v9, v10);
    v25 = 0;
    v18 = v93;
    goto LABEL_69;
  }
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "isUserEnrollment");

  if (v58)
  {
    objc_msgSend(MEMORY[0x24BE60D80], "allowedDeviceQueriesWithUserEnrollment");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self;
    -[MDMParser _deviceInformationWithRequest:allowedQueries:](self, "_deviceInformationWithRequest:allowedQueries:", v8, v54);
    v55 = objc_claimAutoreleasedReturnValue();
LABEL_65:
    v25 = (void *)v55;

    goto LABEL_66;
  }
  v19 = self;
  -[MDMParser _deviceInformationWithRequest:accessRights:](self, "_deviceInformationWithRequest:accessRights:", v8, a4);
  v31 = objc_claimAutoreleasedReturnValue();
LABEL_28:
  v25 = (void *)v31;
LABEL_66:
  v18 = v93;
LABEL_67:
  -[MDMParser _sendAnalyticsMDMCommandEventWithRequest:response:](v19, "_sendAnalyticsMDMCommandEventWithRequest:response:", v8, v25, v92);
  if (v10)
    v10[2](v10, v25);
LABEL_69:

}

- (void)_processRequest:(id)a3 accessRights:(unint64_t)a4 assertion:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  id v24;
  id WeakRetained;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  int v32;
  NSObject *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  objc_super v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint8_t buf[4];
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = MEMORY[0x24BDAC760];
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __68__MDMParser__processRequest_accessRights_assertion_completionBlock___block_invoke;
  v46[3] = &unk_24EB689B8;
  v14 = v12;
  v48 = v14;
  v15 = v11;
  v47 = v15;
  v16 = (void *)MEMORY[0x22767CBAC](v46);
  objc_msgSend(v10, "objectForKey:", CFSTR("RequestType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("CommandFormatError"));
    v29 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v18 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v50 = v17;
    _os_log_impl(&dword_222CB9000, v18, OS_LOG_TYPE_DEFAULT, "Handling request type: %{public}@", buf, 0xCu);
  }
  v19 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v20 = v19;
    objc_msgSend(v10, "DMCShortenedPlistDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v50 = v21;
    _os_log_impl(&dword_222CB9000, v20, OS_LOG_TYPE_DEBUG, "Handling request: %{public}@", buf, 0xCu);

  }
  v22 = +[MDMRequestClasses classForRequestType:](MDMRequestClasses, "classForRequestType:", v17);
  if (-[objc_class isSubclassOfClass:](v22, "isSubclassOfClass:", objc_opt_class()))
  {
    v45 = 0;
    -[objc_class load:serializationType:error:](v22, "load:serializationType:error:", v10, 0, &v45);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v45;
    if (v23)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_server);
      objc_msgSend(v23, "setChannelType:", objc_msgSend(WeakRetained, "channelType"));

      objc_msgSend(v23, "setDelegate:", self);
      objc_msgSend(v23, "setAccessRights:", a4);
      objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setIsUserEnrollment:", objc_msgSend(v26, "isUserEnrollment"));

      v44 = v24;
      LOBYTE(WeakRetained) = objc_msgSend(v23, "isRequestAllowedWithError:", &v44);
      v27 = v44;

      if ((WeakRetained & 1) != 0)
      {
        if (objc_msgSend(v23, "shouldBlockUserSwitch"))
        {
          v28 = MEMORY[0x22767CBAC](v16);

          v14 = (id)v28;
        }
        v41[0] = MEMORY[0x24BDAC760];
        v41[1] = 3221225472;
        v41[2] = __68__MDMParser__processRequest_accessRights_assertion_completionBlock___block_invoke_630;
        v41[3] = &unk_24EB689E0;
        v41[4] = self;
        v42 = v10;
        v14 = v14;
        v43 = v14;
        objc_msgSend(v23, "processRequest:completionHandler:", v42, v41);

        goto LABEL_26;
      }
      +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v27);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v27;
    }
    else
    {
      v33 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v50 = v24;
        _os_log_impl(&dword_222CB9000, v33, OS_LOG_TYPE_ERROR, "Malformed command %{public}@.", buf, 0xCu);
      }
      +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*((void (**)(id, void *))v14 + 2))(v14, v34);

LABEL_26:
    v30 = 0;
    goto LABEL_27;
  }
  if (!objc_msgSend(v17, "isEqualToString:", CFSTR("ClearPasscode")))
  {
    v32 = objc_msgSend(v17, "isEqualToString:", CFSTR("RequestUnlockToken"));
    v13 = MEMORY[0x24BDAC760];
    if (v32)
    {
      -[MDMParser _requestUnlockToken:](self, "_requestUnlockToken:", v10);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("ProfileList")))
    {
      -[MDMParser _profileList:](self, "_profileList:", v10);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("CertificateList")))
    {
      -[MDMParser _certificateList:](self, "_certificateList:", v10);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("RemoveProfile")))
    {
      -[MDMParser _removeProfile:](self, "_removeProfile:", v10);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("ProvisioningProfileList")))
    {
      -[MDMParser _provisioningProfileList:](self, "_provisioningProfileList:", v10);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("InstallProvisioningProfile")))
    {
      -[MDMParser _installProvisioningProfile:](self, "_installProvisioningProfile:", v10);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("RemoveProvisioningProfile")))
    {
      -[MDMParser _removeProvisioningProfile:](self, "_removeProvisioningProfile:", v10);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("InstalledApplicationList")))
    {
      -[MDMParser _installedApplicationList:](self, "_installedApplicationList:", v10);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("Restrictions")))
    {
      -[MDMParser _restrictions:](self, "_restrictions:", v10);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("Settings")))
    {
      -[MDMParser _settings:accessRights:](self, "_settings:accessRights:", v10, a4);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("InstallApplication")))
      {
        -[MDMParser _installApplication:assertion:completionBlock:](self, "_installApplication:assertion:completionBlock:", v10, v15, v16);
        goto LABEL_26;
      }
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("ValidateApplications")))
      {
        -[MDMParser _validateApplications:](self, "_validateApplications:", v10);
        v29 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v17, "isEqualToString:", CFSTR("ApplyRedemptionCode")))
      {
        -[MDMParser _applyRedemptionCode:assertion:](self, "_applyRedemptionCode:assertion:", v10, v15);
        v29 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v17, "isEqualToString:", CFSTR("ManagedApplicationList")))
      {
        -[MDMParser _managedApplicationList:](self, "_managedApplicationList:", v10);
        v29 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v17, "isEqualToString:", CFSTR("ManagedApplicationConfiguration")))
      {
        -[MDMParser _managedApplicationConfiguration:](self, "_managedApplicationConfiguration:", v10);
        v29 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v17, "isEqualToString:", CFSTR("ManagedApplicationAttributes")))
      {
        -[MDMParser _managedApplicationAttributes:](self, "_managedApplicationAttributes:", v10);
        v29 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v17, "isEqualToString:", CFSTR("ManagedApplicationFeedback")))
      {
        -[MDMParser _managedApplicationFeedback:](self, "_managedApplicationFeedback:", v10);
        v29 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v17, "isEqualToString:", CFSTR("RemoveApplication")))
      {
        -[MDMParser _removeApplication:](self, "_removeApplication:", v10);
        v29 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("RequestMirroring")))
        {
          -[MDMParser _requestMirroringRequest:assertion:completionBlock:](self, "_requestMirroringRequest:assertion:completionBlock:", v10, v15, v16);
          goto LABEL_26;
        }
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("StopMirroring")))
        {
          -[MDMParser _stopMirroringRequest:assertion:completionBlock:](self, "_stopMirroringRequest:assertion:completionBlock:", v10, v15, v16);
          goto LABEL_26;
        }
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("InviteToProgram")))
        {
          -[MDMParser _inviteToProgramRequest:assertion:completionBlock:](self, "_inviteToProgramRequest:assertion:completionBlock:", v10, v15, v16);
          goto LABEL_26;
        }
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("ActivationLockBypassCode")))
        {
          -[MDMParser _activationLockBypassCodeRequest:completionBlock:](self, "_activationLockBypassCodeRequest:completionBlock:", v10, v16);
          goto LABEL_26;
        }
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("ClearActivationLockBypassCode")))
        {
          -[MDMParser _clearActivationLockBypassCodeRequest:completionBlock:](self, "_clearActivationLockBypassCodeRequest:completionBlock:", v10, v16);
          goto LABEL_26;
        }
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("InstallMedia")))
        {
          -[MDMParser _installMedia:assertion:completionBlock:](self, "_installMedia:assertion:completionBlock:", v10, v15, v16);
          goto LABEL_26;
        }
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("ManagedMediaList")))
        {
          -[MDMParser _managedMediaList:assertion:completionBlock:](self, "_managedMediaList:assertion:completionBlock:", v10, v15, v16);
          goto LABEL_26;
        }
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("RemoveMedia")))
        {
          -[MDMParser _removeMedia:assertion:completionBlock:](self, "_removeMedia:assertion:completionBlock:", v10, v15, v16);
          goto LABEL_26;
        }
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("DeviceConfigured")))
        {
          -[MDMParser _deviceConfigured:assertion:completionBlock:](self, "_deviceConfigured:assertion:completionBlock:", v10, v15, v16);
          goto LABEL_26;
        }
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("UserConfigured")))
        {
          -[MDMParser _userConfigured:assertion:completionBlock:](self, "_userConfigured:assertion:completionBlock:", v10, v15, v16);
          goto LABEL_26;
        }
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("ScheduleOSUpdate")))
        {
          -[MDMParser _scheduleOSUpdate:assertion:completionBlock:](self, "_scheduleOSUpdate:assertion:completionBlock:", v10, v15, v16);
          goto LABEL_26;
        }
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("ScheduleOSUpdateScan")))
        {
          -[MDMParser _scheduleOSUpdateScan:assertion:completionBlock:](self, "_scheduleOSUpdateScan:assertion:completionBlock:", v10, v15, v16);
          goto LABEL_26;
        }
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("AvailableOSUpdates")))
        {
          -[MDMParser _availableOSUpdates:assertion:completionBlock:](self, "_availableOSUpdates:assertion:completionBlock:", v10, v15, v16);
          goto LABEL_26;
        }
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("OSUpdateStatus")))
        {
          -[MDMParser _statusOfOSUpdates:assertion:completionBlock:](self, "_statusOfOSUpdates:assertion:completionBlock:", v10, v15, v16);
          goto LABEL_26;
        }
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("DeleteUser")))
        {
          -[MDMParser _deleteUser:](self, "_deleteUser:", v10);
          v29 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v17, "isEqualToString:", CFSTR("DeclarativeManagement")))
        {
          -[MDMParser _declarativeManagement:](self, "_declarativeManagement:", v10);
          v29 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v17, "isEqualToString:", CFSTR("TriggerDiagnostics")))
        {
          if (!-[MDMParser _isTriggerDiagnosticsAllowed](self, "_isTriggerDiagnosticsAllowed"))
          {
            -[MDMParser _invalidRequestTypeError:](self, "_invalidRequestTypeError:", v17);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v35);
            v30 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_18;
          }
          -[MDMParser _triggerDiagnostics:](self, "_triggerDiagnostics:", v10);
          v29 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v17, "isEqualToString:", CFSTR("RefreshCellularPlans")))
          {
            v40.receiver = self;
            v40.super_class = (Class)MDMParser;
            -[MDMAbstractTunnelParser processRequest:assertion:completionBlock:](&v40, sel_processRequest_assertion_completionBlock_, v10, v15, v16);
            goto LABEL_26;
          }
          -[MDMParser _refreshCellularPlans:](self, "_refreshCellularPlans:", v10);
          v29 = objc_claimAutoreleasedReturnValue();
        }
      }
    }
LABEL_13:
    v30 = (id)v29;
    goto LABEL_14;
  }
  -[MDMParser _clearPasscode:](self, "_clearPasscode:", v10);
  v30 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
  v13 = MEMORY[0x24BDAC760];
LABEL_14:
  -[MDMParser _sendAnalyticsMDMCommandEventWithRequest:response:](self, "_sendAnalyticsMDMCommandEventWithRequest:response:", v10, v30);
  if (v14)
  {
    dispatch_get_global_queue(0, 0);
    v31 = objc_claimAutoreleasedReturnValue();
    v36[0] = v13;
    v36[1] = 3221225472;
    v36[2] = __68__MDMParser__processRequest_accessRights_assertion_completionBlock___block_invoke_2;
    v36[3] = &unk_24EB68A08;
    v14 = v14;
    v39 = v14;
    v30 = v30;
    v37 = v30;
    v38 = v15;
    dispatch_async(v31, v36);

  }
LABEL_27:

}

uint64_t __68__MDMParser__processRequest_accessRights_assertion_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __68__MDMParser__processRequest_accessRights_assertion_completionBlock___block_invoke_630(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

uint64_t __68__MDMParser__processRequest_accessRights_assertion_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)willTerminateProcess:(id)a3
{
  MDMServerCore **p_server;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  p_server = &self->_server;
  WeakRetained = objc_loadWeakRetained((id *)p_server);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_server);
    objc_msgSend(v6, "responseFromBasicResponse:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "sendResponseSynchronously:outStatusCode:outError:", v7, 0, 0);

  }
}

- (void)didInitiateSwitchUser
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  objc_msgSend(WeakRetained, "setUserSwitchAlreadyInitiated:", 1);

}

- (id)_profileList:(id)a3
{
  return -[MDMParser _profileList:filterFlags:](self, "_profileList:filterFlags:", a3, 17);
}

- (id)_profileList:(id)a3 filterFlags:(int)a4
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[2];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ManagedOnly"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_msgSend(v5, "BOOLValue");
    objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isUserEnrollment");

    if (v8 | v6)
      v9 = a4 | 0x20u;
    else
      v9 = a4;
    +[MDMMCInterface profileListWithFilterFlags:](MDMMCInterface, "profileListWithFilterFlags:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v10;
      _os_log_impl(&dword_222CB9000, v11, OS_LOG_TYPE_INFO, "Returning profile array: %{public}@", buf, 0xCu);
    }
    v12 = *MEMORY[0x24BE61338];
    v15[0] = CFSTR("Status");
    v15[1] = v12;
    v16[0] = CFSTR("Acknowledged");
    v16[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)_originator
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v9;

  -[MDMParser server](self, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "organizationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[MDMParser server](self, "server");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serverName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    DMCLocalizedFormat();
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_clearPasscode:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;
  id v20;
  id v21;

  objc_msgSend(a3, "objectForKey:", CFSTR("UnlockToken"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = (void *)MEMORY[0x24BE2A810];
    v5 = *MEMORY[0x24BE613F0];
    v6 = *MEMORY[0x24BE60F38];
    objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    LOBYTE(v19) = objc_msgSend(v7, "isUserEnrollment");
    objc_msgSend(v4, "dataFromService:account:label:description:group:useSystemKeychain:enforcePersonalPersona:outError:", v5, v6, 0, 0, 0, 0, v19, &v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v21;

    objc_msgSend(MEMORY[0x24BE2A810], "stringFromServiceData:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      v13 = *MEMORY[0x24BE2A728];
      DMCErrorArray();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v13, 12019, v14, v9, *MEMORY[0x24BE2A588], 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v10, "dataUsingEncoding:", 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      +[MDMMCInterface clearPasscodeWithEscrowKeybagData:secret:outError:](MDMMCInterface, "clearPasscodeWithEscrowKeybagData:secret:outError:", v3, v14, &v20);
      v15 = v20;
    }
    v17 = v15;

    if (v17)
      +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v17);
    else
      +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("CommandFormatError"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)_requestUnlockToken:(id)a3
{
  return +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("CommandFormatError"));
}

- (id)_deleteUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ForceDeletion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ForceDeletion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeleteAllUsers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeleteAllUsers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  if (objc_msgSend(v8, "BOOLValue"))
  {
    -[MDMParser _deleteAllUsersWithForceDeletion:](self, "_deleteAllUsersWithForceDeletion:", objc_msgSend(v6, "BOOLValue"));
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v13 = (void *)v9;
    goto LABEL_17;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UserName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_15;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UserName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_15:
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("CommandFormatError"));
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setUsername:", v11);
  objc_msgSend(v12, "setForceDeletion:", objc_msgSend(v6, "BOOLValue"));
  +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v15 = (id)objc_msgSend(v14, "performRequest:error:", v12, &v36);
  v16 = v36;

  if (v16)
  {
    v17 = objc_msgSend(v16, "code");
    switch(v17)
    {
      case 1801:
        v31 = (void *)MEMORY[0x24BDD1540];
        v18 = *MEMORY[0x24BE2A728];
        DMCErrorArray();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *MEMORY[0x24BE2A588];
        v21 = v31;
        v22 = v18;
        v23 = 12072;
        goto LABEL_23;
      case 1802:
        v33 = (void *)MEMORY[0x24BDD1540];
        v26 = *MEMORY[0x24BE2A728];
        DMCErrorArray();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *MEMORY[0x24BE2A588];
        v21 = v33;
        v22 = v26;
        v23 = 12071;
        goto LABEL_23;
      case 1803:
        v34 = (void *)MEMORY[0x24BDD1540];
        v27 = *MEMORY[0x24BE2A728];
        DMCErrorArray();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *MEMORY[0x24BE2A588];
        v21 = v34;
        v22 = v27;
        v23 = 12073;
        goto LABEL_23;
      case 1804:
        v35 = (void *)MEMORY[0x24BDD1540];
        v28 = *MEMORY[0x24BE2A728];
        DMCErrorArray();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *MEMORY[0x24BE2A588];
        v21 = v35;
        v22 = v28;
        v23 = 12074;
        goto LABEL_23;
      default:
        if (v17 != 1700)
          goto LABEL_24;
        v32 = (void *)MEMORY[0x24BDD1540];
        v25 = *MEMORY[0x24BE2A728];
        DMCErrorArray();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *MEMORY[0x24BE2A588];
        v21 = v32;
        v22 = v25;
        v23 = 12070;
LABEL_23:
        objc_msgSend(v21, "DMCErrorWithDomain:code:descriptionArray:errorType:", v22, v23, v19, v20, 0);
        v29 = objc_claimAutoreleasedReturnValue();

        v16 = (id)v29;
LABEL_24:
        +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v16);
        v30 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v30;
        break;
    }
  }

LABEL_17:
  return v13;
}

- (id)_deleteAllUsersWithForceDeletion:(BOOL)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  dispatch_semaphore_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  id obj;
  _QWORD v30[5];
  id v31;
  __CFString *v32;
  dispatch_semaphore_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_DEFAULT, "Deleting all users...", buf, 2u);
  }
  objc_msgSend((id)DMCUMUserManagerClass(), "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allUsers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v11, "username");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v12)
          v14 = (__CFString *)v12;
        else
          v14 = CFSTR("Unknown");
        v15 = v14;

        objc_msgSend(v4, "currentUser");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToUser:", v11);

        if (v17)
          goto LABEL_16;
        if (objc_msgSend(v11, "hasDataToSync") && !a3)
        {
          v18 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v39 = v11;
            _os_log_impl(&dword_222CB9000, v18, OS_LOG_TYPE_DEFAULT, "User %{public}@ has data to sync.", buf, 0xCu);
          }
LABEL_16:
          DMCLocalizedString();
          v19 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, v15);
          goto LABEL_18;
        }
        v20 = dispatch_semaphore_create(0);
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __46__MDMParser__deleteAllUsersWithForceDeletion___block_invoke;
        v30[3] = &unk_24EB68A30;
        v30[4] = v11;
        v31 = v6;
        v32 = v15;
        v33 = v20;
        v19 = v20;
        objc_msgSend(v4, "deleteUser:completionHandler:", v11, v30);
        dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);

LABEL_18:
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v6, "count"))
  {
    v21 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "DMCErrorWithDomain:code:descriptionArray:errorType:", v22, 12074, v23, *MEMORY[0x24BE2A588], v6, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = v27;
  }

  return v25;
}

void __46__MDMParser__deleteAllUsersWithForceDeletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138543618;
      v8 = v5;
      v9 = 2114;
      v10 = v3;
      _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_ERROR, "Failed to delete user: %{public}@ with error: %{public}@", (uint8_t *)&v7, 0x16u);
    }
    DMCLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 48));

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

- (id)_refreshCellularPlans:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("eSIMServerURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v7 = 0;
    v5 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("eSIMServerURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v7 = 0;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
LABEL_16:
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("CommandFormatError"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_msgSend(v6, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("http")))
  {
    objc_msgSend(v7, "scheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("https"));

    if ((v10 & 1) != 0)
      goto LABEL_9;
    goto LABEL_16;
  }

LABEL_9:
  v11 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v32 = v7;
    _os_log_impl(&dword_222CB9000, v11, OS_LOG_TYPE_DEFAULT, "Refreshing available data plans from URL: %{public}@", buf, 0xCu);
  }
  v12 = (void *)objc_opt_new();
  +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setESIMServerURL:", v7);
  objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v15 = (id)objc_msgSend(v14, "performRequest:error:", v12, &v30);
  v16 = v30;

  if (v16)
  {
    v17 = objc_msgSend(v16, "code");
    if ((unint64_t)(v17 - 203) < 2 || v17 == 201)
    {
      v26 = (void *)MEMORY[0x24BDD1540];
      v27 = *MEMORY[0x24BE2A728];
      DMCErrorArray();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *MEMORY[0x24BE2A588];
      v22 = v26;
      v23 = v27;
      v24 = 36003;
    }
    else
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = *MEMORY[0x24BE2A728];
      if (v17 == 202)
      {
        DMCErrorArray();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *MEMORY[0x24BE2A588];
        v22 = v18;
        v23 = v19;
        v24 = 36002;
      }
      else
      {
        DMCErrorArray();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *MEMORY[0x24BE2A588];
        v22 = v18;
        v23 = v19;
        v24 = 36001;
      }
    }
    objc_msgSend(v22, "DMCErrorWithDomain:code:descriptionArray:errorType:", v23, v24, v20, v21, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v28);
    v29 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v29;
  }

LABEL_17:
  return v13;
}

- (id)_declarativeManagement:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSString *managingProfileIdentifier;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v5, OS_LOG_TYPE_DEFAULT, "Processing DeclarativeManagement command", buf, 2u);
  }
  +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  managingProfileIdentifier = self->_managingProfileIdentifier;
  v15 = 0;
  v8 = +[MDMDeclarativeManagementCommand processRequestTypeWithProfileIdentifier:request:error:](MDMDeclarativeManagementCommand, "processRequestTypeWithProfileIdentifier:request:error:", managingProfileIdentifier, v4, &v15);

  v9 = v15;
  if (!v8)
  {
    v10 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      objc_msgSend(v9, "DMCVerboseDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v12;
      _os_log_impl(&dword_222CB9000, v11, OS_LOG_TYPE_ERROR, "Failed to process DeclarativeManagement command with error: %{public}@", buf, 0xCu);

    }
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v9);
    v13 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v13;
  }

  return v6;
}

+ (id)_MCKeysToDMFKeys
{
  if (_MCKeysToDMFKeys_onceToken != -1)
    dispatch_once(&_MCKeysToDMFKeys_onceToken, &__block_literal_global_678);
  return (id)_MCKeysToDMFKeys_MCKeysToDMFKeys;
}

void __29__MDMParser__MCKeysToDMFKeys__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  _QWORD v82[54];
  _QWORD v83[55];

  v83[54] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE2C660];
  v1 = *MEMORY[0x24BE612A0];
  v82[0] = *MEMORY[0x24BE61210];
  v82[1] = v1;
  v2 = *MEMORY[0x24BE2C6C0];
  v83[0] = v0;
  v83[1] = v2;
  v3 = *MEMORY[0x24BE2C578];
  v4 = *MEMORY[0x24BE61170];
  v82[2] = *MEMORY[0x24BE610E0];
  v82[3] = v4;
  v5 = *MEMORY[0x24BE2C5D0];
  v83[2] = v3;
  v83[3] = v5;
  v6 = *MEMORY[0x24BE2C4E8];
  v7 = *MEMORY[0x24BE612D0];
  v82[4] = *MEMORY[0x24BE61088];
  v82[5] = v7;
  v8 = *MEMORY[0x24BE2C718];
  v83[4] = v6;
  v83[5] = v8;
  v9 = *MEMORY[0x24BE2C710];
  v10 = *MEMORY[0x24BE610E8];
  v82[6] = *MEMORY[0x24BE612C8];
  v82[7] = v10;
  v11 = *MEMORY[0x24BE2C608];
  v83[6] = v9;
  v83[7] = v11;
  v12 = *MEMORY[0x24BE2C5F8];
  v13 = *MEMORY[0x24BE611E8];
  v82[8] = *MEMORY[0x24BE611A8];
  v82[9] = v13;
  v14 = *MEMORY[0x24BE2C640];
  v83[8] = v12;
  v83[9] = v14;
  v15 = *MEMORY[0x24BE2C508];
  v16 = *MEMORY[0x24BE61080];
  v82[10] = *MEMORY[0x24BE610D8];
  v82[11] = v16;
  v17 = *MEMORY[0x24BE2C4E0];
  v83[10] = v15;
  v83[11] = v17;
  v18 = *MEMORY[0x24BE2C518];
  v19 = *MEMORY[0x24BE61090];
  v82[12] = *MEMORY[0x24BE610B0];
  v82[13] = v19;
  v20 = *MEMORY[0x24BE2C4F0];
  v83[12] = v18;
  v83[13] = v20;
  v21 = *MEMORY[0x24BE2C5C8];
  v22 = *MEMORY[0x24BE61100];
  v82[14] = *MEMORY[0x24BE61168];
  v82[15] = v22;
  v23 = *MEMORY[0x24BE2C558];
  v83[14] = v21;
  v83[15] = v23;
  v24 = *MEMORY[0x24BE2C5B0];
  v25 = *MEMORY[0x24BE61140];
  v82[16] = *MEMORY[0x24BE61148];
  v82[17] = v25;
  v26 = *MEMORY[0x24BE2C5A0];
  v83[16] = v24;
  v83[17] = v26;
  v27 = *MEMORY[0x24BE2C588];
  v28 = *MEMORY[0x24BE61138];
  v82[18] = *MEMORY[0x24BE61128];
  v82[19] = v28;
  v29 = *MEMORY[0x24BE2C598];
  v83[18] = v27;
  v83[19] = v29;
  v30 = *MEMORY[0x24BE2C590];
  v31 = *MEMORY[0x24BE612C0];
  v82[20] = *MEMORY[0x24BE61130];
  v82[21] = v31;
  v32 = *MEMORY[0x24BE2C708];
  v83[20] = v30;
  v83[21] = v32;
  v33 = *MEMORY[0x24BE2C620];
  v34 = *MEMORY[0x24BE61120];
  v82[22] = *MEMORY[0x24BE611D8];
  v82[23] = v34;
  v35 = *MEMORY[0x24BE2C570];
  v83[22] = v33;
  v83[23] = v35;
  v36 = *MEMORY[0x24BE2C5E0];
  v37 = *MEMORY[0x24BE611B8];
  v82[24] = *MEMORY[0x24BE61180];
  v82[25] = v37;
  v38 = *MEMORY[0x24BE2C600];
  v83[24] = v36;
  v83[25] = v38;
  v39 = *MEMORY[0x24BE2C568];
  v40 = *MEMORY[0x24BE61108];
  v82[26] = *MEMORY[0x24BE61118];
  v82[27] = v40;
  v41 = *MEMORY[0x24BE2C560];
  v83[26] = v39;
  v83[27] = v41;
  v42 = *MEMORY[0x24BE2C528];
  v43 = *MEMORY[0x24BE61208];
  v82[28] = *MEMORY[0x24BE610B8];
  v82[29] = v43;
  v44 = *MEMORY[0x24BE2C648];
  v83[28] = v42;
  v83[29] = v44;
  v45 = *MEMORY[0x24BE2C698];
  v46 = *MEMORY[0x24BE610A8];
  v82[30] = *MEMORY[0x24BE61260];
  v82[31] = v46;
  v47 = *MEMORY[0x24BE2C510];
  v83[30] = v45;
  v83[31] = v47;
  v48 = *MEMORY[0x24BE2C628];
  v49 = *MEMORY[0x24BE61268];
  v82[32] = *MEMORY[0x24BE611E0];
  v82[33] = v49;
  v50 = *MEMORY[0x24BE2C6A0];
  v83[32] = v48;
  v83[33] = v50;
  v51 = *MEMORY[0x24BE2C6A8];
  v52 = *MEMORY[0x24BE610C0];
  v82[34] = *MEMORY[0x24BE61270];
  v82[35] = v52;
  v53 = *MEMORY[0x24BE2C530];
  v83[34] = v51;
  v83[35] = v53;
  v54 = *MEMORY[0x24BE2C538];
  v55 = *MEMORY[0x24BE610D0];
  v82[36] = *MEMORY[0x24BE610C8];
  v82[37] = v55;
  v56 = *MEMORY[0x24BE2C540];
  v83[36] = v54;
  v83[37] = v56;
  v57 = *MEMORY[0x24BE2C6F8];
  v58 = *MEMORY[0x24BE61160];
  v82[38] = *MEMORY[0x24BE612B8];
  v82[39] = v58;
  v59 = *MEMORY[0x24BE2C5C0];
  v83[38] = v57;
  v83[39] = v59;
  v60 = *MEMORY[0x24BE2C550];
  v61 = *MEMORY[0x24BE61070];
  v82[40] = *MEMORY[0x24BE610F8];
  v82[41] = v61;
  v62 = *MEMORY[0x24BE2C4C8];
  v83[40] = v60;
  v83[41] = v62;
  v63 = *MEMORY[0x24BE2C5A8];
  v64 = *MEMORY[0x24BE611C0];
  v82[42] = *MEMORY[0x24BE61150];
  v82[43] = v64;
  v65 = *MEMORY[0x24BE2C610];
  v83[42] = v63;
  v83[43] = v65;
  v66 = *MEMORY[0x24BE2C500];
  v67 = *MEMORY[0x24BE611A0];
  v82[44] = *MEMORY[0x24BE610A0];
  v82[45] = v67;
  v68 = *MEMORY[0x24BE2C5F0];
  v83[44] = v66;
  v83[45] = v68;
  v69 = *MEMORY[0x24BE2C4F8];
  v70 = *MEMORY[0x24BE61158];
  v82[46] = *MEMORY[0x24BE61098];
  v82[47] = v70;
  v71 = *MEMORY[0x24BE2C5B8];
  v83[46] = v69;
  v83[47] = v71;
  v72 = *MEMORY[0x24BE2C690];
  v73 = *MEMORY[0x24BE61218];
  v82[48] = *MEMORY[0x24BE61240];
  v82[49] = v73;
  v74 = *MEMORY[0x24BE2C668];
  v83[48] = v72;
  v83[49] = v74;
  v75 = *MEMORY[0x24BE2C670];
  v76 = *MEMORY[0x24BE61228];
  v82[50] = *MEMORY[0x24BE61220];
  v82[51] = v76;
  v77 = *MEMORY[0x24BE2C680];
  v83[50] = v75;
  v83[51] = v77;
  v78 = *MEMORY[0x24BE61238];
  v82[52] = *MEMORY[0x24BE61230];
  v82[53] = v78;
  v79 = *MEMORY[0x24BE2C688];
  v83[52] = *MEMORY[0x24BE2C678];
  v83[53] = v79;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v83, v82, 54);
  v80 = objc_claimAutoreleasedReturnValue();
  v81 = (void *)_MCKeysToDMFKeys_MCKeysToDMFKeys;
  _MCKeysToDMFKeys_MCKeysToDMFKeys = v80;

}

+ (id)_MCKeysWithNoMatchingDMFKey
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[24];

  v17[23] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = *MEMORY[0x24BE61078];
  v17[0] = *MEMORY[0x24BE61068];
  v17[1] = v3;
  v4 = *MEMORY[0x24BE61110];
  v17[2] = *MEMORY[0x24BE610F0];
  v17[3] = v4;
  v5 = *MEMORY[0x24BE61198];
  v17[4] = *MEMORY[0x24BE61190];
  v17[5] = v5;
  v6 = *MEMORY[0x24BE61188];
  v17[6] = *MEMORY[0x24BE61178];
  v17[7] = v6;
  v7 = *MEMORY[0x24BE611C8];
  v17[8] = *MEMORY[0x24BE611B0];
  v17[9] = v7;
  v8 = *MEMORY[0x24BE611F8];
  v17[10] = *MEMORY[0x24BE611D0];
  v17[11] = v8;
  v9 = *MEMORY[0x24BE61248];
  v17[12] = *MEMORY[0x24BE61200];
  v17[13] = v9;
  v10 = *MEMORY[0x24BE61258];
  v17[14] = *MEMORY[0x24BE61250];
  v17[15] = v10;
  v11 = *MEMORY[0x24BE61280];
  v17[16] = *MEMORY[0x24BE61278];
  v17[17] = v11;
  v12 = *MEMORY[0x24BE61290];
  v17[18] = *MEMORY[0x24BE61288];
  v17[19] = v12;
  v13 = *MEMORY[0x24BE612A8];
  v17[20] = *MEMORY[0x24BE61298];
  v17[21] = v13;
  v17[22] = *MEMORY[0x24BE612B0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_DMFKeysToMCKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__MDMParser__DMFKeysToMCKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_DMFKeysToMCKeys_onceToken != -1)
    dispatch_once(&_DMFKeysToMCKeys_onceToken, block);
  return (id)_DMFKeysToMCKeys_DMFKeysToMCKeys;
}

void __29__MDMParser__DMFKeysToMCKeys__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "_MCKeysToDMFKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v0, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = v0;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v2, "objectForKeyedSubscript:", v7, (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "setObject:forKeyedSubscript:", v7, v8);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  v9 = objc_msgSend(v1, "copy");
  v10 = (void *)_DMFKeysToMCKeys_DMFKeysToMCKeys;
  _DMFKeysToMCKeys_DMFKeysToMCKeys = v9;

}

- (id)_serviceSubscriptionPropertiesWithDMFKeysMappedToMCKeys:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_DMFKeysToMCKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v11, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (id)_serviceSubscriptionsWithDMFKeysMappedToMCKeys:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[MDMParser _serviceSubscriptionPropertiesWithDMFKeysMappedToMCKeys:](self, "_serviceSubscriptionPropertiesWithDMFKeysMappedToMCKeys:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)_deviceInformationWithRequest:(id)a3 accessRights:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;

  v6 = (void *)MEMORY[0x24BE60D70];
  v7 = a3;
  objc_msgSend(v6, "sharedConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personaID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 != 0;

  -[MDMParser _allowedDeviceQueriesForAccessRights:isDataSeparated:](self, "_allowedDeviceQueriesForAccessRights:isDataSeparated:", a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMParser _deviceInformationWithRequest:allowedQueries:](self, "_deviceInformationWithRequest:allowedQueries:", v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_deviceInformationWithRequest:(id)a3 allowedQueries:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  id v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  MDMParser *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  BOOL v104;
  void *v105;
  uint64_t v106;
  const __CFArray *v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const __SCNetworkInterface *v114;
  uint64_t v115;
  NSObject *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  unint64_t v133;
  unint64_t v134;
  unint64_t v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  void *v139;
  double v140;
  void *v141;
  uint64_t v142;
  void *v143;
  double v144;
  void *v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  void *v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  void *v155;
  id v156;
  void *v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  void *v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  void *v167;
  void *v168;
  id v169;
  NSObject *v170;
  void *v171;
  __SecCertificate *v172;
  CFDataRef v173;
  __SecCertificate *v174;
  CFDataRef v175;
  NSObject *v176;
  void *v177;
  uint64_t v178;
  void *v179;
  void *v180;
  id v181;
  id v182;
  id v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  int v192;
  MDMParser *v193;
  uint64_t v194;
  void *v195;
  void *v196;
  id v197;
  void *v198;
  id obj;
  void *v200;
  id v201;
  id v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  id v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  id v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  _QWORD v225[2];
  _QWORD v226[2];
  uint8_t v227[128];
  uint8_t buf[4];
  uint64_t v229;
  __int16 v230;
  void *v231;
  _BYTE v232[128];
  _BYTE v233[128];
  _BYTE v234[128];
  _BYTE v235[128];
  uint64_t v236;

  v236 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("DeviceAttestationNonce"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !objc_msgSend(v8, "length")
      || (v9 = objc_msgSend(v8, "length"), v9 > *MEMORY[0x24BE60EE0]))
    {
      +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("CommandFormatError"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("Queries"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || !objc_msgSend(v11, "count"))
  {
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("CommandFormatError"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
  v193 = self;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v221 = 0u;
  v222 = 0u;
  v223 = 0u;
  v224 = 0u;
  v187 = v11;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v221, v235, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v222;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v222 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v221 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("CommandFormatError"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v187;
          goto LABEL_185;
        }
        if (objc_msgSend(v7, "containsObject:", v17))
          objc_msgSend(v191, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v221, v235, 16);
    }
    while (v14);
  }

  if ((objc_msgSend(MEMORY[0x24BE2A818], "hasInternetTetheringCapability") & 1) == 0)
    objc_msgSend(v191, "removeObject:", *MEMORY[0x24BE611D8]);
  objc_msgSend((id)objc_opt_class(), "_MCKeysToDMFKeys");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v200 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v191, "count"));
  v217 = 0u;
  v218 = 0u;
  v219 = 0u;
  v220 = 0u;
  v18 = v191;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v217, v234, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v218;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v218 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v217 + 1) + 8 * j));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend(v200, "addObject:", v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v217, v234, 16);
    }
    while (v20);
  }
  v185 = v8;

  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "setPropertyKeys:", v200);
  objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v216 = 0;
  objc_msgSend(v25, "performRequest:error:", v24, &v216);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v216;

  v28 = (void *)objc_opt_class();
  if (v27)
  {
    objc_msgSend(v28, "responseWithError:", v27);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v187;
    goto LABEL_184;
  }
  v180 = v24;
  v182 = v6;
  v183 = v7;
  objc_msgSend(v28, "_DMFKeysToMCKeys");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = v26;
  objc_msgSend(v26, "valuesByPropertyKey");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v30, "count"));
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = objc_msgSend(v186, "isUserEnrollment");
  v212 = 0u;
  v213 = 0u;
  v214 = 0u;
  v215 = 0u;
  obj = v30;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v212, v233, 16);
  v181 = v12;
  v197 = v18;
  if (!v31)
    goto LABEL_71;
  v32 = v31;
  v33 = *(_QWORD *)v213;
  v34 = *MEMORY[0x24BE61150];
  v35 = *MEMORY[0x24BE61240];
  v194 = *MEMORY[0x24BE610D8];
  v190 = *MEMORY[0x24BE61080];
  v188 = *MEMORY[0x24BE61100];
  v189 = *MEMORY[0x24BDBCDB8];
  do
  {
    v36 = 0;
    do
    {
      if (*(_QWORD *)v213 != v33)
        objc_enumerationMutation(obj);
      v37 = *(_QWORD *)(*((_QWORD *)&v212 + 1) + 8 * v36);
      objc_msgSend(obj, "objectForKeyedSubscript:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "objectForKeyedSubscript:", v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "isEqualToString:", v34))
      {
        v40 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
        v41 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "numberWithBool:", objc_msgSend(v41, "userMode") == 1);
        v42 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_43;
      }
      if (objc_msgSend(v39, "isEqualToString:", v35))
      {
        -[MDMParser _serviceSubscriptionsWithDMFKeysMappedToMCKeys:](v193, "_serviceSubscriptionsWithDMFKeysMappedToMCKeys:", v38);
        v43 = objc_claimAutoreleasedReturnValue();
        goto LABEL_47;
      }
      if (!objc_msgSend(v39, "isEqualToString:", v194))
      {
        if (objc_msgSend(v39, "isEqualToString:", v190))
        {
          objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/private/var"));
          v41 = (id)objc_claimAutoreleasedReturnValue();
          v211 = 0;
          objc_msgSend(v41, "getResourceValue:forKey:error:", &v211, v189, 0);
          v48 = v211;
          if (v48)
          {
            v49 = v48;
            v50 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v48, "floatValue");
            if (v192)
            {
              *(float *)&v51 = *(float *)&v51 / 1000000000.0;
              objc_msgSend(v50, "numberWithFloat:", v51);
            }
            else
            {
              objc_msgSend(v50, "numberWithDouble:", *(float *)&v51 / 1000000000.0);
            }
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            v42 = v55;
LABEL_43:
            v38 = v42;
LABEL_44:
            v18 = v197;
          }
        }
        else
        {
          if (!v192 || !objc_msgSend(v39, "isEqualToString:", v188))
          {
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v38, "isEqual:", v52);

            v18 = v197;
            if ((v53 & 1) != 0)
              goto LABEL_51;
            goto LABEL_49;
          }
          objc_msgSend(v186, "easEnrollmentID");
          v43 = objc_claimAutoreleasedReturnValue();
LABEL_47:
          v41 = v38;
          v38 = (void *)v43;
        }

        goto LABEL_49;
      }
      objc_msgSend(MEMORY[0x24BE2A818], "diskCapacity");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        v45 = v44;
        v46 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v44, "floatValue");
        if (v192)
        {
          *(float *)&v47 = *(float *)&v47 / 1000000000.0;
          objc_msgSend(v46, "numberWithFloat:", v47);
        }
        else
        {
          objc_msgSend(v46, "numberWithDouble:", *(float *)&v47 / 1000000000.0);
        }
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = v54;
        v38 = v41;
        goto LABEL_44;
      }
LABEL_49:
      if (v39)
        objc_msgSend(v196, "setObject:forKeyedSubscript:", v38, v39);
LABEL_51:

      ++v36;
    }
    while (v32 != v36);
    v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v212, v233, 16);
    v32 = v56;
  }
  while (v56);
LABEL_71:

  objc_msgSend(v184, "errorsByPropertyKey");
  v207 = 0u;
  v208 = 0u;
  v209 = 0u;
  v210 = 0u;
  v57 = (id)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v207, v232, 16);
  v195 = v57;
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v208;
    do
    {
      for (k = 0; k != v59; ++k)
      {
        if (*(_QWORD *)v208 != v60)
          objc_enumerationMutation(v57);
        v62 = *(void **)(*((_QWORD *)&v207 + 1) + 8 * k);
        objc_msgSend(v57, "objectForKeyedSubscript:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v64 = *(id *)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v63, "DMCVerboseDescription");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v229 = (uint64_t)v62;
            v230 = 2114;
            v231 = v65;
            _os_log_impl(&dword_222CB9000, v64, OS_LOG_TYPE_ERROR, "Failed to retrieve device information key %{public}@ with error: %{public}@", buf, 0x16u);

            v18 = v197;
          }

          v57 = v195;
        }

      }
      v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v207, v232, 16);
    }
    while (v59);
  }

  v66 = *MEMORY[0x24BE611D0];
  v7 = v183;
  v67 = v185;
  v12 = v181;
  v68 = v193;
  v69 = v196;
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE611D0]))
  {
    -[MDMParser server](v193, "server");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "organizationInfo");
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    if (v71)
      objc_msgSend(v196, "setObject:forKeyedSubscript:", v71, v66);

    v18 = v197;
  }
  v72 = *MEMORY[0x24BE61178];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE61178]))
  {
    -[MDMParser server](v193, "server");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "MDMOptions");
    v74 = objc_claimAutoreleasedReturnValue();
    v75 = (void *)v74;
    if (v74)
      v76 = v74;
    else
      v76 = MEMORY[0x24BDBD1B8];
    objc_msgSend(v196, "setObject:forKeyedSubscript:", v76, v72);

    v18 = v197;
  }
  v77 = *MEMORY[0x24BE61158];
  v6 = v182;
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE61158]))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", DMCDeviceIsNetworkTethered());
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "setObject:forKeyedSubscript:", v78, v77);

  }
  v79 = *MEMORY[0x24BE611A0];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE611A0]))
  {
    DMCIOModelString();
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "setObject:forKeyedSubscript:", v80, v79);

  }
  v81 = *MEMORY[0x24BE611B0];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE611B0]))
  {
    objc_msgSend(MEMORY[0x24BE2A818], "modelNumber");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE2A818], "regionInfo");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "setObject:forKeyedSubscript:", v84, v81);

    v67 = v185;
    v18 = v197;

  }
  v85 = *MEMORY[0x24BE611C0];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE611C0]))
  {
    objc_msgSend(MEMORY[0x24BE2A818], "marketingVersion");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "setObject:forKeyedSubscript:", v86, v85);

  }
  v87 = *MEMORY[0x24BE610A0];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE610A0]))
  {
    objc_msgSend(MEMORY[0x24BE2A818], "buildVersion");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "setObject:forKeyedSubscript:", v88, v87);

  }
  v89 = *MEMORY[0x24BE61280];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE61280]))
  {
    objc_msgSend(MEMORY[0x24BE2A818], "supplementalMarketingVersionExtra");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "setObject:forKeyedSubscript:", v90, v89);

  }
  v91 = *MEMORY[0x24BE61278];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE61278]))
  {
    objc_msgSend(MEMORY[0x24BE2A818], "supplementalBuildVersion");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "setObject:forKeyedSubscript:", v92, v91);

  }
  v93 = *MEMORY[0x24BE61098];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE61098]))
  {
    DMCIOBluetoothMAC();
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "setObject:forKeyedSubscript:", v94, v93);

  }
  v95 = *MEMORY[0x24BE61298];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE61298]))
  {
    objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "name");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "setObject:forKeyedSubscript:", v97, v95);

    v18 = v197;
  }
  v98 = *MEMORY[0x24BE61250];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE61250]))
  {
    -[MDMParser server](v193, "server");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "softwareUpdatePathFromDisk");
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    if (v100)
      objc_msgSend(v196, "setObject:forKeyedSubscript:", v100, v98);

    v18 = v197;
  }
  v101 = *MEMORY[0x24BE61088];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE61088]))
  {
    -[MDMParser server](v193, "server");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = objc_msgSend(v102, "channelType");

    v104 = v103 == 1;
    v18 = v197;
    if (v104)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(MEMORY[0x24BE2A820], "isCurrentUserConfigured") ^ 1);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v196, "setObject:forKeyedSubscript:", v105, v101);

    }
  }
  v106 = *MEMORY[0x24BE612C0];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE612C0]))
  {
    v203 = 0u;
    v204 = 0u;
    v205 = 0u;
    v206 = 0u;
    v107 = SCNetworkInterfaceCopyAll();
    v108 = -[__CFArray countByEnumeratingWithState:objects:count:](v107, "countByEnumeratingWithState:objects:count:", &v203, v227, 16);
    v109 = v107;
    if (v108)
    {
      v110 = v108;
      v111 = *(_QWORD *)v204;
      v112 = *MEMORY[0x24BDF5A48];
LABEL_120:
      v113 = 0;
      while (1)
      {
        if (*(_QWORD *)v204 != v111)
          objc_enumerationMutation(v107);
        v114 = *(const __SCNetworkInterface **)(*((_QWORD *)&v203 + 1) + 8 * v113);
        if ((-[__CFString isEqualToString:]((id)SCNetworkInterfaceGetInterfaceType(v114), "isEqualToString:", v112) & 1) != 0)
          break;
        if (v110 == ++v113)
        {
          v110 = -[__CFArray countByEnumeratingWithState:objects:count:](v107, "countByEnumeratingWithState:objects:count:", &v203, v227, 16);
          if (v110)
            goto LABEL_120;
          v109 = v107;
          v7 = v183;
          v68 = v193;
          goto LABEL_129;
        }
      }
      SCNetworkInterfaceGetHardwareAddressString(v114);
      v109 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v183;
      v68 = v193;
      if (!v109)
        goto LABEL_130;
      objc_msgSend(v196, "setObject:forKeyedSubscript:", v109, v106);
    }
LABEL_129:

LABEL_130:
    v67 = v185;
    v69 = v196;
  }
  v115 = *MEMORY[0x24BE611F8];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE611F8]))
  {
    v116 = *(id *)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)DMCUMUserManagerClass(), "sharedManager");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = objc_msgSend(v117, "userQuotaSize");
      *(_DWORD *)buf = 134217984;
      v229 = v118;
      _os_log_impl(&dword_222CB9000, v116, OS_LOG_TYPE_DEFAULT, "Quota Size is:%llu", buf, 0xCu);

    }
    v119 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend((id)DMCUMUserManagerClass(), "sharedManager");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "numberWithUnsignedLongLong:", objc_msgSend(v120, "userQuotaSize") / 0xF4240uLL);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setObject:forKeyedSubscript:", v121, v115);

    v18 = v197;
  }
  v122 = *MEMORY[0x24BE61200];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE61200]))
  {
    v123 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend((id)DMCUMUserManagerClass(), "sharedManager");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "allUsers");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "numberWithUnsignedInteger:", objc_msgSend(v125, "count"));
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setObject:forKeyedSubscript:", v126, v122);

    v67 = v185;
    v18 = v197;
  }
  v127 = *MEMORY[0x24BE61198];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE61198]))
    objc_msgSend(v69, "setObject:forKeyedSubscript:", &unk_24EB77B28, v127);
  v128 = *MEMORY[0x24BE61110];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE61110]))
  {
    objc_msgSend((id)DMCUMUserManagerClass(), "sharedManager");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "allUsers");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = objc_msgSend(v130, "count");

    objc_msgSend((id)DMCUMUserManagerClass(), "sharedManager");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = objc_msgSend(v132, "userQuotaSize");

    if (v133)
      v134 = objc_msgSend(MEMORY[0x24BE2A820], "getDiskAvailableSize") / v133;
    else
      v134 = 0;
    v135 = v134 + v131;
    if (v135 >= 0x20)
      v136 = 32;
    else
      v136 = v135;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v136);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setObject:forKeyedSubscript:", v137, v128);

    v67 = v185;
    v18 = v197;
  }
  v138 = *MEMORY[0x24BE612A8];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE612A8]))
  {
    v139 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE2A820], "userSessionTimeout");
    objc_msgSend(v139, "numberWithInteger:", (uint64_t)v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setObject:forKeyedSubscript:", v141, v138);

  }
  v142 = *MEMORY[0x24BE61290];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE61290]))
  {
    v143 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE2A820], "temporarySessionTimeout");
    objc_msgSend(v143, "numberWithInteger:", (uint64_t)v144);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setObject:forKeyedSubscript:", v145, v142);

  }
  v146 = *MEMORY[0x24BE61288];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE61288]))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(MEMORY[0x24BE2A820], "temporarySessionOnly"));
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setObject:forKeyedSubscript:", v147, v146);

  }
  v148 = *MEMORY[0x24BE61190];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE61190]))
  {
    objc_msgSend(MEMORY[0x24BE2A820], "managedAppleIDDefaultDomains");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setObject:forKeyedSubscript:", v149, v148);

  }
  v150 = *MEMORY[0x24BE611C8];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE611C8]))
  {
    objc_msgSend(MEMORY[0x24BE2A820], "onlineAuthenticationGracePeriod");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setObject:forKeyedSubscript:", v151, v150);

  }
  v152 = *MEMORY[0x24BE61248];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE61248]))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(MEMORY[0x24BE2A820], "shouldSkipLanguageAndLocaleSetupForNewUsers"));
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setObject:forKeyedSubscript:", v153, v152);

  }
  v154 = *MEMORY[0x24BE61188];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE61188]))
  {
    v202 = 0;
    objc_msgSend(MEMORY[0x24BE2A7B8], "midWithError:", &v202);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = v202;
    if (v156)
    {
      v157 = v156;
      objc_msgSend((id)objc_opt_class(), "responseWithError:", v156);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_182;
    }
    objc_msgSend(v69, "setObject:forKeyedSubscript:", v155, v154);

    v67 = v185;
  }
  v158 = *MEMORY[0x24BE61078];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE61078]))
  {
    objc_msgSend((id)objc_opt_class(), "appstoredUserAgent");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setObject:forKeyedSubscript:", v159, v158);

  }
  v160 = *MEMORY[0x24BE612B0];
  if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE612B0]))
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "deviceIdentifierForVendorSeedData");
    v157 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v157, "length"))
    {
      objc_msgSend(v69, "setObject:forKeyedSubscript:", v157, v160);

      v18 = v197;
      goto LABEL_168;
    }
    v176 = *(id *)DMCLogObjects();
    if (os_log_type_enabled(v176, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v176, OS_LOG_TYPE_ERROR, "Failed to fetch VID seed", buf, 2u);
    }

    v177 = (void *)MEMORY[0x24BDD1540];
    v178 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "DMCErrorWithDomain:code:descriptionArray:errorType:", v178, 12103, v179, *MEMORY[0x24BE2A588], 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "responseWithError:", v27);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_168:
    v162 = *MEMORY[0x24BE61258];
    if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE61258]))
    {
      objc_msgSend(MEMORY[0x24BEAEC88], "currentProductType");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setObject:forKeyedSubscript:", v163, v162);

    }
    v164 = *MEMORY[0x24BE61068];
    if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE61068]))
    {
      -[MDMParser _accessibilitySettings](v68, "_accessibilitySettings");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setObject:forKeyedSubscript:", v165, v164);

    }
    v166 = *MEMORY[0x24BE610F0];
    if (objc_msgSend(v18, "containsObject:", *MEMORY[0x24BE610F0]))
    {
      +[MDMAttestation sharedInstance](MDMAttestation, "sharedInstance");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      v201 = 0;
      objc_msgSend(v167, "attestationCertificateChainAnonymous:nonce:outError:", objc_msgSend(v186, "isUserEnrollment"), v67, &v201);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v169 = v201;

      if (!v168 || v169)
      {
        v170 = *(id *)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v229 = (uint64_t)v169;
          _os_log_impl(&dword_222CB9000, v170, OS_LOG_TYPE_ERROR, "Failed obtaining device attestation certificate chain. Continuing without attestation. Error: %@", buf, 0xCu);
        }

      }
      if (objc_msgSend(v168, "count") == 2)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v168, "objectAtIndexedSubscript:", 0);
        v172 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
        v173 = SecCertificateCopyData(v172);
        objc_msgSend(v171, "setObject:atIndexedSubscript:", v173, 0);

        objc_msgSend(v168, "objectAtIndexedSubscript:", 1);
        v174 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
        v175 = SecCertificateCopyData(v174);
        objc_msgSend(v171, "setObject:atIndexedSubscript:", v175, 1);

        v69 = v196;
        objc_msgSend(v196, "setObject:forKeyedSubscript:", v171, v166);

      }
      v68 = v193;
    }
    -[MDMParser _applyOverridesToDeviceInformationDictionary:](v68, "_applyOverridesToDeviceInformationDictionary:", v69);
    v226[0] = CFSTR("Acknowledged");
    v225[0] = CFSTR("Status");
    v225[1] = CFSTR("QueryResponses");
    v157 = (void *)objc_msgSend(v69, "copy");
    v226[1] = v157;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v226, v225, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_182:
    v27 = 0;
  }
  v11 = v187;

  v24 = v180;
  v26 = v184;
LABEL_184:

  v8 = v185;
LABEL_185:

LABEL_33:
LABEL_34:

  return v10;
}

- (void)_applyOverridesToDeviceInformationDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v3 = a3;
  v4 = *MEMORY[0x24BE611A8];
  v29 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE611A8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BE2A7F0];
    objc_msgSend(v29, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modelNameWithDefaultValue:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v8, v4);

  }
  v9 = *MEMORY[0x24BE611B0];
  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x24BE611B0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BE2A7F0];
    objc_msgSend(v29, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "modelNumberWithDefaultValue:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v13, v9);

  }
  v14 = *MEMORY[0x24BE611E8];
  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x24BE611E8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x24BE2A7F0];
    objc_msgSend(v29, "objectForKeyedSubscript:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "productNameWithDefaultValue:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v18, v14);

  }
  v19 = *MEMORY[0x24BE610E8];
  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x24BE610E8]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)MEMORY[0x24BE2A7F0];
    objc_msgSend(v29, "objectForKeyedSubscript:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "deviceNameWithDefaultValue:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v23, v19);

  }
  v24 = *MEMORY[0x24BE61258];
  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x24BE61258]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = (void *)MEMORY[0x24BE2A7F0];
    objc_msgSend(v29, "objectForKeyedSubscript:", v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "softwareUpdateDeviceIDWithDefaultValue:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v24);

  }
}

- (id)_allowedDeviceQueriesForAccessRights:(unint64_t)a3
{
  return -[MDMParser _allowedDeviceQueriesForAccessRights:isDataSeparated:](self, "_allowedDeviceQueriesForAccessRights:isDataSeparated:", a3, 0);
}

- (id)_allowedDeviceQueriesForAccessRights:(unint64_t)a3 isDataSeparated:(BOOL)a4
{
  return (id)objc_msgSend(MEMORY[0x24BE60D80], "allowedDeviceQueriesForAccessRights:isDataSeparated:", a3, a4);
}

- (id)_certificateList:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  CFTypeID TypeID;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  SecCertificateRef v20;
  CFTypeID v21;
  CFDataRef v22;
  CFDataRef v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  id obj;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  SecCertificateRef certificateRef;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[2];
  _QWORD v47[2];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ManagedOnly"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
  }
  v30 = v3;
  v4 = objc_msgSend(v3, "BOOLValue");
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUserEnrollment");

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "installedProfilesWithFilterFlags:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_opt_new();
  TypeID = SecIdentityGetTypeID();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v7;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (!v34)
    goto LABEL_31;
  v33 = v6 | v4;
  v32 = *(_QWORD *)v43;
  do
  {
    for (i = 0; i != v34; ++i)
    {
      if (*(_QWORD *)v43 != v32)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
      if (!v33 || objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "isManagedByMDM"))
      {
        v35 = i;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        objc_msgSend(v10, "payloads");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
        if (!v12)
          goto LABEL_28;
        v13 = v12;
        v14 = *(_QWORD *)v39;
        while (1)
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v39 != v14)
              objc_enumerationMutation(v11);
            v16 = *(id *)(*((_QWORD *)&v38 + 1) + 8 * j);
            v17 = (void *)objc_opt_new();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = (void *)MEMORY[0x24BE63C78];
              objc_msgSend(v16, "certificatePersistentID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = (SecCertificateRef)objc_msgSend(v18, "copyItemWithPersistentID:useSystemKeychain:", v19, 1);

              if (v20)
              {
                certificateRef = 0;
                v21 = CFGetTypeID(v20);
                if (v21 == TypeID)
                {
                  SecIdentityCopyCertificate(v20, &certificateRef);
                  CFRelease(v20);
                  v20 = certificateRef;
                  if (!certificateRef)
                    goto LABEL_26;
                }
                else
                {
                  certificateRef = v20;
                }
                v22 = SecCertificateCopyData(v20);
                if (v22)
                {
                  v23 = v22;
                  objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, CFSTR("Data"));

                }
                v24 = (void *)SecCertificateCopyCommonNames();
                CFRelease(certificateRef);
                if (v24)
                {
                  objc_msgSend(v24, "firstObject");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, CFSTR("CommonName"));

                }
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v21 == TypeID);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setObject:forKeyedSubscript:", v26, CFSTR("IsIdentity"));

                objc_msgSend(v36, "addObject:", v17);
              }
            }
LABEL_26:

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
          if (!v13)
          {
LABEL_28:

            i = v35;
            break;
          }
        }
      }
    }
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  }
  while (v34);
LABEL_31:

  v46[0] = CFSTR("Status");
  v46[1] = CFSTR("CertificateList");
  v47[0] = CFSTR("Acknowledged");
  v47[1] = v36;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = v30;
LABEL_33:

  return v27;
}

- (id)_provisioningProfileList:(id)a3
{
  void *v3;
  unsigned int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  CFTypeRef cf[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ManagedOnly"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = v3;
    v4 = objc_msgSend(v3, "BOOLValue");
    objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isUserEnrollment");

    +[MDMMCInterface provisioningProfileUUIDsWithManagedOnly:](MDMMCInterface, "provisioningProfileUUIDsWithManagedOnly:", v6 | v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          cf[0] = 0;
          v14 = MISCopyProvisioningProfile();
          if ((_DWORD)v14)
          {
            v17 = v14;

            v18 = *(NSObject **)(DMCLogObjects() + 8);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              LOWORD(cf[0]) = 0;
              _os_log_impl(&dword_222CB9000, v18, OS_LOG_TYPE_ERROR, "Could not retrieve the list of provisioning profiles.", (uint8_t *)cf, 2u);
            }
            v19 = (void *)MEMORY[0x24BDD1540];
            v20 = *MEMORY[0x24BE2A688];
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v17);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            DMCErrorArray();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "DMCErrorWithDomain:code:descriptionArray:errorType:", v20, 25003, v22, *MEMORY[0x24BE2A588], v21, 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v23);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_15;
          }
          v15 = (void *)objc_opt_new();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", MISProvisioningProfileGetName(), CFSTR("Name"));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", MISProvisioningProfileGetUUID(), CFSTR("UUID"));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", MISProvisioningProfileGetExpirationDate(), CFSTR("ExpiryDate"));
          CFRelease(cf[0]);
          objc_msgSend(v8, "addObject:", v15);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        if (v11)
          continue;
        break;
      }
    }

    v31[0] = CFSTR("Status");
    v31[1] = CFSTR("ProvisioningProfileList");
    v32[0] = CFSTR("Acknowledged");
    v32[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
    v3 = v25;

  }
  return v16;
}

- (id)_installProvisioningProfile:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v9;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ProvisioningProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMParser managingProfileIdentifier](self, "managingProfileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  +[MDMMCInterface installProvisioningProfileData:managingProfileIdentifier:outError:](MDMMCInterface, "installProvisioningProfileData:managingProfileIdentifier:outError:", v4, v5, &v9);
  v6 = v9;

  if (v6)
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v6);
  else
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_isProfileIdentifierManaged:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[MDMParser isChaperoned](self, "isChaperoned"))
  {
    v5 = 1;
  }
  else if (self->_managingProfileIdentifier)
  {
    v5 = +[MDMMCInterface isProfileWithIdentifier:managedByProfileWithIdentifier:](MDMMCInterface, "isProfileWithIdentifier:managedByProfileWithIdentifier:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isDDMProfileIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = (void *)MEMORY[0x24BE63CB0];
  v4 = a3;
  objc_msgSend(v3, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "installedProfileWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "installOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE63E10]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_isProvisioningProfileUUIDManaged:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[MDMParser isChaperoned](self, "isChaperoned"))
  {
    v5 = 1;
  }
  else if (self->_managingProfileIdentifier)
  {
    v5 = +[MDMMCInterface isProvisioningProfileWithUUID:managedByProfileWithIdentifier:](MDMMCInterface, "isProvisioningProfileWithUUID:managedByProfileWithIdentifier:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_removeProvisioningProfile:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v13;

  objc_msgSend(a3, "objectForKey:", CFSTR("UUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (-[MDMParser isChaperoned](self, "isChaperoned")
      || -[MDMParser _isProvisioningProfileUUIDManaged:](self, "_isProvisioningProfileUUIDManaged:", v4))
    {
      -[MDMParser managingProfileIdentifier](self, "managingProfileIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      +[MDMMCInterface removeProvisioningProfileWithUUID:managingProfileIdentifier:outError:](MDMMCInterface, "removeProvisioningProfileWithUUID:managingProfileIdentifier:outError:", v4, v5, &v13);
      v6 = v13;

      if (!v6)
      {
        +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v8 = (void *)v7;

        goto LABEL_10;
      }
    }
    else
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      v10 = *MEMORY[0x24BE2A728];
      DMCErrorArray();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "DMCErrorWithDomain:code:descriptionArray:errorType:", v10, 12014, v11, *MEMORY[0x24BE2A588], v4, 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("CommandFormatError"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v8;
}

- (BOOL)_identifiersIsStringArray:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v4 = v3;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v12;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v12 != v7)
              objc_enumerationMutation(v4);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v9 = 0;
              goto LABEL_15;
            }
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (v6)
            continue;
          break;
        }
      }
      v9 = 1;
LABEL_15:

    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)_installedApplicationList:(id)a3
{
  id v3;
  MDMInstalledApplicationListCommand *v4;
  MDMAppPropertyShim *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(MDMInstalledApplicationListCommand);
  v5 = objc_alloc_init(MDMAppPropertyShim);
  -[MDMInstalledApplicationListCommand setDataSource:](v4, "setDataSource:", v5);

  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMInstalledApplicationListCommand setIsUserEnrollment:](v4, "setIsUserEnrollment:", objc_msgSend(v6, "isUserEnrollment"));

  -[MDMInstalledApplicationListCommand responseForRequest:](v4, "responseForRequest:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_restrictions:(id)a3
{
  return -[MDMParser _restrictions:withProfileFilterFlags:](self, "_restrictions:withProfileFilterFlags:", a3, 19);
}

- (id)_restrictions:(id)a3 withProfileFilterFlags:(int)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  id v54;
  _BYTE v55[128];
  const __CFString *v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (_restrictions_withProfileFilterFlags__onceToken != -1)
    dispatch_once(&_restrictions_withProfileFilterFlags__onceToken, &__block_literal_global_712);
  v56 = CFSTR("Status");
  v57[0] = CFSTR("Acknowledged");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  objc_msgSend(v9, "performRequest:error:", v8, &v54);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v54;

  if (!v11)
  {
    v48 = v8;
    objc_msgSend(v10, "restrictions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MDMMCInterface filterMDMRestrictions:acceptingKeysFromDictionary:](MDMMCInterface, "filterMDMRestrictions:acceptingKeysFromDictionary:", v18, _restrictions_withProfileFilterFlags__mdmQueryableRestrictions);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("GlobalRestrictions"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("GlobalRestrictions"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ProfileRestrictions"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v20, "BOOLValue"))
        {
          v47 = v7;
          v21 = (void *)objc_opt_new();
          v22 = v21;
          if (a4 == 3)
            v23 = 0;
          else
            v23 = a4 & 0x3F;
          objc_msgSend(v21, "setFilterFlags:", v23);
          v24 = v22;
          objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = 0;
          objc_msgSend(v25, "performRequest:error:", v22, &v53);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v53;

          if (v27)
          {
            v28 = (void *)MEMORY[0x24BDD1540];
            v29 = *MEMORY[0x24BE2A728];
            DMCErrorArray();
            v30 = v26;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "DMCErrorWithDomain:code:descriptionArray:errorType:", v29, 12083, v31, *MEMORY[0x24BE2A588], 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend((id)objc_opt_class(), "responseWithError:", v16);
            v17 = (id)objc_claimAutoreleasedReturnValue();

            v7 = v47;
LABEL_22:

            v8 = v48;
            goto LABEL_23;
          }
          v44 = v24;
          v45 = v20;
          v46 = v5;
          v32 = (void *)objc_opt_new();
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v43 = v26;
          objc_msgSend(v26, "profiles");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v50;
            do
            {
              for (i = 0; i != v35; ++i)
              {
                if (*(_QWORD *)v50 != v36)
                  objc_enumerationMutation(v33);
                v38 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
                objc_msgSend(v38, "restrictions");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                +[MDMMCInterface filterMDMRestrictions:acceptingKeysFromDictionary:](MDMMCInterface, "filterMDMRestrictions:acceptingKeysFromDictionary:", v39, _restrictions_withProfileFilterFlags__mdmQueryableRestrictions);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "identifier");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "setObject:forKeyedSubscript:", v40, v41);

              }
              v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
            }
            while (v35);
          }

          v7 = v47;
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v32, CFSTR("ProfileRestrictions"));

          v20 = v45;
          v5 = v46;
        }
      }
    }
    v17 = v7;
    v16 = 0;
    goto LABEL_22;
  }
  v12 = (void *)MEMORY[0x24BDD1540];
  v13 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v14 = v7;
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:errorType:", v13, 12082, v15, *MEMORY[0x24BE2A588], 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v14;
  objc_msgSend((id)objc_opt_class(), "responseWithError:", v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v17;
}

void __50__MDMParser__restrictions_withProfileFilterFlags___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[MDMMCInterface mdmQueryableRestrictions](MDMMCInterface, "mdmQueryableRestrictions");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_restrictions_withProfileFilterFlags__mdmQueryableRestrictions;
  _restrictions_withProfileFilterFlags__mdmQueryableRestrictions = v0;

}

- (unint64_t)_profileInstallationStyleForRequest:(id)a3
{
  void *v3;
  unint64_t v4;

  -[MDMParser managingProfileIdentifier](self, "managingProfileIdentifier", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_installProfile:(id)a3 accessRights:(unint64_t)a4
{
  return -[MDMParser _installProfile:accessRights:installationType:](self, "_installProfile:accessRights:installationType:", a3, a4, 0);
}

- (id)_installProfile:(id)a3 accessRights:(unint64_t)a4 installationType:(int64_t)a5
{
  char v6;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v27;
  uint8_t buf[16];
  id v29;
  char v30;

  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "objectForKey:", CFSTR("Payload"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v30 = 0;
    v29 = 0;
    +[MDMMCInterface profileIdentifierForProfileData:allowEmptyPayload:outIsSupervisionProfile:outProfileSigner:outMayInstallCloudProfile:outError:](MDMMCInterface, "profileIdentifierForProfileData:allowEmptyPayload:outIsSupervisionProfile:outProfileSigner:outMayInstallCloudProfile:outError:", v9, 0, &v30, 0, 0, &v29);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v29;
    if (v11)
    {
LABEL_3:
      +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
      goto LABEL_25;
    }
    if (-[MDMParser isChaperoned](self, "isChaperoned")
      || self->_managingProfileIdentifier && (objc_msgSend(v10, "isEqualToString:") & 1) != 0
      || (objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "isUserEnrollment"),
          v13,
          (v6 & 2) != 0)
      || (v14 & 1) != 0)
    {
      if (!-[MDMParser _isDDMProfileIdentifier:](self, "_isDDMProfileIdentifier:", v10))
      {
        if (v30)
        {
          v16 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_222CB9000, v16, OS_LOG_TYPE_DEFAULT, "Ignoring supervision profile.", buf, 2u);
          }
        }
        else
        {
          v17 = (void *)objc_opt_new();
          -[MDMParser managingProfileIdentifier](self, "managingProfileIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setManagingProfileIdentifier:", v18);

          objc_msgSend(v17, "setStyle:", -[MDMParser _profileInstallationStyleForRequest:](self, "_profileInstallationStyleForRequest:", v8));
          objc_msgSend(v17, "setProfileData:", v9);
          objc_msgSend(v17, "setType:", a5 == 1);
          objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "personaID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
            objc_msgSend(v17, "setPersonaID:", v20);
          objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 0;
          v22 = (id)objc_msgSend(v21, "performRequest:error:", v17, &v27);
          v11 = v27;

          objc_msgSend(v11, "userInfo");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            v25 = v24;

            v11 = v25;
          }

          if (v11)
            goto LABEL_3;
        }
        goto LABEL_23;
      }
      -[MDMParser _managedByDDMError:](self, "_managedByDDMError:", v10);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MDMParser _notAuthorizedError](self, "_notAuthorizedError");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (id)v15;
    if (v15)
      goto LABEL_3;
LABEL_23:
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("CommandFormatError"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

  return v12;
}

- (id)_removeProfile:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("Identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[MDMParser _removeProfileWithIdentifier:forInstalledProfilesWithFilterFlags:](self, "_removeProfileWithIdentifier:forInstalledProfilesWithFilterFlags:", v4, 19);
  else
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("CommandFormatError"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_removeProfileWithIdentifier:(id)a3 forInstalledProfilesWithFilterFlags:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  +[MDMMCInterface profileIdentifiersWithFilterFlags:](MDMMCInterface, "profileIdentifiersWithFilterFlags:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "containsObject:", v6))
  {
    -[MDMParser _removeProfileWithIdentifier:installationType:](self, "_removeProfileWithIdentifier:installationType:", v6, (~(_DWORD)v4 & 9) == 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "DMCErrorWithDomain:code:descriptionArray:errorType:", v10, 12075, v11, *MEMORY[0x24BE2A588], v6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (id)v11;
  }

  return v8;
}

- (id)_removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  if (!self->_managingProfileIdentifier)
    goto LABEL_8;
  if (objc_msgSend(v6, "isEqualToString:"))
  {
    v8 = (void *)objc_opt_new();

    objc_msgSend(v8, "setProfileIdentifier:", v6);
    objc_msgSend(v8, "setType:", a4 == 1);
    objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "performRequest:completion:", v8, &__block_literal_global_725);

    v10 = 0;
    goto LABEL_14;
  }
  if (-[MDMParser _isDDMProfileIdentifier:](self, "_isDDMProfileIdentifier:", v6))
  {
    -[MDMParser _managedByDDMError:](self, "_managedByDDMError:", v6);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (-[MDMParser isChaperoned](self, "isChaperoned")
    || -[MDMParser _isProfileIdentifierManaged:](self, "_isProfileIdentifierManaged:", v6))
  {
LABEL_8:
    objc_msgSend(v7, "setProfileIdentifier:", v6);
    objc_msgSend(v7, "setType:", a4 == 1);
    objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v13 = (id)objc_msgSend(v12, "performRequest:error:", v7, &v21);
    v11 = v21;

  }
  else
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "DMCErrorWithDomain:code:descriptionArray:errorType:", v19, 12013, v20, *MEMORY[0x24BE2A588], v6, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

  if (v11)
  {
    objc_msgSend(v11, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = v15;

      v11 = v16;
    }
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_14:

  return v10;
}

void __59__MDMParser__removeProfileWithIdentifier_installationType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_ERROR, "Could not remove MDM profile: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }

}

- (BOOL)_validateSetting:(id)a3 accessRights:(unint64_t)a4 outError:(id *)a5
{
  __int16 v6;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  BOOL v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  char v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _BOOL4 v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id obj;
  id obja;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v6 = a4;
  v67 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(v8, "objectForKey:", CFSTR("Item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_140;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_140;
  -[MDMParser _allSettingsItems](self, "_allSettingsItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v9);

  if (!v11)
    goto LABEL_140;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("DeviceName")))
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("DeviceName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      goto LABEL_6;
    goto LABEL_139;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("Wallpaper")))
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("Image"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_139;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_139;
    objc_msgSend(v8, "objectForKey:", CFSTR("Where"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (int)objc_msgSend(v14, "intValue") < 1
      || (int)objc_msgSend(v14, "intValue") > 3)
    {
      goto LABEL_16;
    }
LABEL_109:

    goto LABEL_7;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("SoftwareUpdateSettings")))
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("RecommendationCadence"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (int)objc_msgSend(v12, "intValue") <= 2
        && (objc_msgSend(v12, "intValue") & 0x80000000) == 0)
      {
        goto LABEL_7;
      }
    }
    goto LABEL_139;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("DataRoaming"))
    || DMCCTSupportsVoiceRoaming()
    && objc_msgSend(v9, "isEqualToString:", CFSTR("VoiceRoaming"))
    || objc_msgSend(v9, "isEqualToString:", CFSTR("Bluetooth"))
    || objc_msgSend(MEMORY[0x24BE2A818], "hasInternetTetheringCapability")
    && objc_msgSend(v9, "isEqualToString:", CFSTR("PersonalHotspot")))
  {
    if ((v6 & 0x20) == 0)
    {
      if (a5)
      {
        -[MDMParser _notAuthorizedError](self, "_notAuthorizedError");
        v13 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_141;
      }
      goto LABEL_140;
    }
LABEL_85:
    v19 = CFSTR("Enabled");
    goto LABEL_86;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("ApplicationConfiguration")))
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("Identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_139;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_139;
    v15 = CFSTR("Configuration");
LABEL_40:
    objc_msgSend(v8, "objectForKey:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isUserEnrollment");

    if ((v6 & 0x1000) != 0 || (v17 & 1) != 0)
      goto LABEL_109;
    if (!a5)
    {
LABEL_16:

      goto LABEL_139;
    }
    -[MDMParser _notAuthorizedError](self, "_notAuthorizedError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_46:
    *a5 = v18;
    goto LABEL_16;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("ApplicationAttributes")))
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("Identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_139;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_139;
    v15 = CFSTR("Attributes");
    goto LABEL_40;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("MaximumResidentUsers")))
  {
    v19 = CFSTR("MaximumResidentUsers");
    goto LABEL_86;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("SharedDeviceConfiguration")))
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("QuotaSize"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("ResidentUsers"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("UserSessionTimeout"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("TemporarySessionTimeout"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("TemporarySessionOnly"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("ManagedAppleIDDefaultDomains"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("OnlineAuthenticationGracePeriod"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AwaitUserConfiguration"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PasscodePolicy"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_81;
    }
    if (v21)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_81;
    }
    if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || obj && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v59 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
LABEL_81:
      v28 = 1;
    }
    else
    {
      objc_msgSend(v25, "objectForKey:", CFSTR("Enabled"));
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKey:", CFSTR("PasscodeLockGracePeriod"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKey:", CFSTR("AutoLockTime"));
      v56 = (void *)v27;
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 1;
      if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (!v58 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          if (!v57 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            v28 = 0;
        }
      }

    }
    if (!v28)
      goto LABEL_8;
LABEL_140:
    v13 = 0;
    goto LABEL_141;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("DiagnosticSubmission")))
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("Enabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_139;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_139;
    if (!+[MDMMCInterface isDiagnosticsSubmissionRestricted](MDMMCInterface, "isDiagnosticsSubmissionRestricted"))goto LABEL_7;
    goto LABEL_79;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("AppAnalytics")))
    goto LABEL_85;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("PasscodeLockGracePeriod")))
  {
    v19 = CFSTR("PasscodeLockGracePeriod");
LABEL_86:
    objc_msgSend(v8, "objectForKey:", v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
LABEL_6:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_7:

LABEL_8:
        v13 = 1;
        goto LABEL_141;
      }
      goto LABEL_139;
    }
    goto LABEL_139;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("OrganizationInfo")))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("OrganizationInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_139;
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BE2A4B8]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v31, "length"))
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BE2A4A0]);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v32 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BE2A4C0]);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              v36 = 1;
            }
            else
            {
              objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BE2A4A8]);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                v36 = 1;
              }
              else
              {
                objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BE2A4B0]);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = 0;
                if (v35)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    v36 = 1;
                }

              }
            }

            if (!v36)
              goto LABEL_7;
            goto LABEL_139;
          }

        }
      }
    }

LABEL_139:
    goto LABEL_140;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("MDMOptions")))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MDMOptions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_139;
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BE61050]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_16;
    }
    goto LABEL_109;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("TimeZone")))
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("TimeZone"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_139;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_139;
    if (!+[MDMMCInterface isAutomaticDateAndTimeForced](MDMMCInterface, "isAutomaticDateAndTimeForced"))
      goto LABEL_7;
LABEL_79:
    if (!a5)
      goto LABEL_139;
    v29 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BE2A6B8];
    DMCErrorArray();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "DMCErrorWithDomain:code:descriptionArray:errorType:", v30, 28003, v14, *MEMORY[0x24BE2A588], 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_46;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("AccessibilitySettings")))
    goto LABEL_140;
  objc_msgSend((id)objc_opt_class(), "_numericAccessibilitySettingsKeys");
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obja = (id)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v63;
    while (2)
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v63 != v39)
          objc_enumerationMutation(obja);
        v41 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a5)
            {
              v45 = (void *)MEMORY[0x24BDD1540];
              v46 = *MEMORY[0x24BE2A6B8];
              v55 = v41;
              DMCErrorArray();
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = *MEMORY[0x24BE2A588];
              v49 = v45;
              v50 = v46;
              v51 = 28006;
              goto LABEL_134;
            }
LABEL_135:

            v13 = 0;
            goto LABEL_136;
          }
          if (objc_msgSend(v41, "isEqualToString:", CFSTR("TextSize")))
          {
            +[MDMAccessibilityManager sharedInstance](MDMAccessibilityManager, "sharedInstance");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v43, "isValidTextSize:", objc_msgSend(v42, "integerValue"));

            if ((v44 & 1) == 0)
            {
              if (a5)
              {
                v52 = (void *)MEMORY[0x24BDD1540];
                v53 = *MEMORY[0x24BE2A6B8];
                v55 = v41;
                DMCErrorArray();
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = *MEMORY[0x24BE2A588];
                v49 = v52;
                v50 = v53;
                v51 = 28007;
LABEL_134:
                objc_msgSend(v49, "DMCErrorWithDomain:code:descriptionArray:errorType:", v50, v51, v47, v48, v55, 0);
                *a5 = (id)objc_claimAutoreleasedReturnValue();

              }
              goto LABEL_135;
            }
          }
        }

      }
      v38 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
      if (v38)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_136:

LABEL_141:
  return v13;
}

- (id)_performSetDeviceName:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[16];

  v3 = a3;
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_DEFAULT, "Setting device name.", buf, 2u);
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("DeviceName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((DMCLockdownSetDeviceName() & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BE2A6E0];
    DMCErrorArray();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "DMCErrorWithDomain:code:descriptionArray:errorType:", v8, 14003, v9, *MEMORY[0x24BE2A588], 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_performSetWallpaper:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  dispatch_semaphore_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  NSObject *v24;
  uint8_t *v25;
  uint8_t buf[8];
  uint8_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t v32[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_DEFAULT, "Setting wallpaper.", buf, 2u);
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Image"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Where"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");

    if (v8 == 3)
    {
      v10 = 1;
    }
    else
    {
      if (v8 == 1)
      {
        v9 = 0;
        v10 = 1;
LABEL_13:
        *(_QWORD *)buf = 0;
        v27 = buf;
        v28 = 0x3032000000;
        v29 = __Block_byref_object_copy__5;
        v30 = __Block_byref_object_dispose__5;
        v31 = 0;
        v15 = dispatch_semaphore_create(0);
        v16 = (void *)objc_opt_new();
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __34__MDMParser__performSetWallpaper___block_invoke;
        v23[3] = &unk_24EB68AD8;
        v17 = v15;
        v24 = v17;
        v25 = buf;
        objc_msgSend(v16, "setWallpaper:forLockScreen:homeScreen:completionHandler:", v6, v10, v9, v23);
        dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
        if (*((_QWORD *)v27 + 5))
        {
          v18 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = *((_QWORD *)v27 + 5);
            *(_DWORD *)v32 = 138543362;
            v33 = v19;
            _os_log_impl(&dword_222CB9000, v18, OS_LOG_TYPE_ERROR, "Failed to set wallpaper with error: %{public}@", v32, 0xCu);
          }
          v20 = (void *)MEMORY[0x24BDD1540];
          DMCErrorArray();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x24BE2A6B8], 28002, v21, *MEMORY[0x24BE2A588], 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v14 = 0;
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_19;
      }
      v10 = 0;
    }
    v9 = 1;
    goto LABEL_13;
  }
  v11 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v11, OS_LOG_TYPE_ERROR, "Could not get image from data", buf, 2u);
  }
  v12 = (void *)MEMORY[0x24BDD1540];
  DMCErrorArray();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x24BE2A6B8], 28001, v13, *MEMORY[0x24BE2A588], 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v14;
}

void __34__MDMParser__performSetWallpaper___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_performSetDataRoaming:(id)a3
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKey:", CFSTR("Enabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    DMCStringForBool();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_DEFAULT, "Setting data roaming enabled: %{public}@", buf, 0xCu);

  }
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setEnabled:", v4);
  objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v10 = (id)objc_msgSend(v9, "performRequest:error:", v8, &v13);
  v11 = v13;

  return v11;
}

- (id)_performSetVoiceRoaming:(id)a3
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKey:", CFSTR("Enabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    DMCStringForBool();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_DEFAULT, "Setting voice roaming enabled: %{public}@", buf, 0xCu);

  }
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setEnabled:", v4);
  objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v10 = (id)objc_msgSend(v9, "performRequest:error:", v8, &v13);
  v11 = v13;

  return v11;
}

- (id)_performSetBluetooth:(id)a3
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Enabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    DMCStringForBool();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_DEFAULT, "Setting Bluetooth enabled: %{public}@", buf, 0xCu);

  }
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setEnabled:", v4);
  objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v10 = (id)objc_msgSend(v9, "performRequest:error:", v8, &v13);
  v11 = v13;

  return v11;
}

- (id)_performSetPersonalHotspot:(id)a3
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKey:", CFSTR("Enabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    DMCStringForBool();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_DEFAULT, "Setting Personal Hotspot enabled: %{public}@", buf, 0xCu);

  }
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setEnabled:", v4);
  objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v10 = (id)objc_msgSend(v9, "performRequest:error:", v8, &v13);
  v11 = v13;

  return v11;
}

- (id)_performSetUpdatePath:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[16];

  v3 = a3;
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_DEFAULT, "Writing Software Update setting to disk.", buf, 2u);
  }
  v5 = (void *)MEMORY[0x24BDBCED8];
  MDMFilePath();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithContentsOfFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "setObject:forKey:", v3, CFSTR("SoftwareUpdateSettings"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", v3, CFSTR("SoftwareUpdateSettings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  MDMFilePath();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "DMCWriteToBinaryFile:", v8);

  if ((v9 & 1) != 0)
  {
    DMCSendSettingsChangedNotification();
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "DMCErrorWithDomain:code:descriptionArray:errorType:", v12, 12098, v13, *MEMORY[0x24BE2A590], 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_malformedRequestError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12008, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_isManagedApp:(id)a3
{
  void *v4;

  objc_msgSend(a3, "managementInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[MDMParser _isManagedAppFromManagementInformation:](self, "_isManagedAppFromManagementInformation:", v4);

  return (char)self;
}

- (BOOL)_isManagedAppFromManagementInformation:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  unsigned int v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "state");
    if (v5 <= 0x10)
      v6 = (0x1F9F5u >> v5) & 1;
    else
      LOBYTE(v6) = 0;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)_handleSetAppManagementInfoRequest:(id)a3 outAdditionalResponseKeys:(id *)a4 block:(id)a5
{
  void (**v8)(id, void *);
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  void (**v34)(id, void *);
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  _BYTE v41[128];
  _QWORD v42[2];
  void *v43;
  const __CFString *v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, void *))a5;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Identifier"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (a4)
  {
    v44 = CFSTR("Identifier");
    v45[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setType:", 2);
  objc_msgSend(v11, "setManagedAppsOnly:", 1);
  v43 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBundleIdentifiers:", v12);

  v42[0] = CFSTR("managementInformation");
  v42[1] = CFSTR("sourceIdentifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPropertyKeys:", v13);

  objc_msgSend(MEMORY[0x24BE2C7E0], "currentUserConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(v14, "performRequest:error:", v11, &v40);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v40;
  v17 = v16;
  if (!v16)
  {
    objc_msgSend(v15, "appsByBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allValues");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[MDMParser _isManagedApp:](self, "_isManagedApp:", v21))
    {
      objc_msgSend(v21, "sourceIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        v8[2](v8, v10);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        if (v26)
        {
          v27 = v26;
          v33 = v21;
          v34 = v8;
          v28 = *(_QWORD *)v37;
          while (2)
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v37 != v28)
                objc_enumerationMutation(v25);
              v30 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
              v35 = 0;
              v31 = (id)objc_msgSend(v14, "performRequest:error:", v30, &v35);
              v32 = v35;
              if (v32)
              {
                v18 = v32;
                goto LABEL_22;
              }
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
            if (v27)
              continue;
            break;
          }
          v18 = 0;
LABEL_22:
          v21 = v33;
          v8 = v34;
        }
        else
        {
          v18 = 0;
        }

        goto LABEL_10;
      }
      -[MDMParser _installApplicationCouldNotModifyDDMAppsError](self, "_installApplicationCouldNotModifyDDMAppsError");
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MDMParser _notManagedErrorAppID:](self, "_notManagedErrorAppID:", v10);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (id)v23;
LABEL_10:

    goto LABEL_11;
  }
  v18 = v16;
LABEL_11:

  return v18;
}

- (id)_performSetAppConfig:(id)a3 outAdditionalResponseKeys:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__MDMParser__performSetAppConfig_outAdditionalResponseKeys___block_invoke;
  v10[3] = &unk_24EB68B00;
  v11 = v6;
  v7 = v6;
  -[MDMParser _handleSetAppManagementInfoRequest:outAdditionalResponseKeys:block:](self, "_handleSetAppManagementInfoRequest:outAdditionalResponseKeys:block:", v7, a4, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __60__MDMParser__performSetAppConfig_outAdditionalResponseKeys___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setBundleIdentifier:", v3);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("Configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConfiguration:", v5);

  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_performSetAppAttributes:(id)a3 outAdditionalResponseKeys:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v24;
  void *v25;
  void *v26;
  id *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Attributes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMParser _appAttributesWithRequestedAttributes:](self, "_appAttributesWithRequestedAttributes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE60FD0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE60FA0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[MDMParser _malformedRequestError](self, "_malformedRequestError");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_54:

        goto LABEL_55;
      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE60FA8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[MDMParser _malformedRequestError](self, "_malformedRequestError");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_53:

        goto LABEL_54;
      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE60FB0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[MDMParser _malformedRequestError](self, "_malformedRequestError");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_52:

        goto LABEL_53;
      }
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE60FB8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[MDMParser _malformedRequestError](self, "_malformedRequestError");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_51:

        goto LABEL_52;
      }
    }
    v36 = v13;
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE60F90]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[MDMParser _malformedRequestError](self, "_malformedRequestError");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v14;
LABEL_50:

        v13 = v36;
        goto LABEL_51;
      }
      v28 = a4;
      v30 = v12;
      v32 = v11;
      v33 = v10;
      v51 = 0u;
      v52 = 0u;
      v50 = 0u;
      v49 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v50;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v50 != v18)
              objc_enumerationMutation(v15);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              -[MDMParser _malformedRequestError](self, "_malformedRequestError");
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              v11 = v32;
              v10 = v33;
              v12 = v30;
              v25 = v14;
              goto LABEL_50;
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
          if (v17)
            continue;
          break;
        }
      }

      v11 = v32;
      v10 = v33;
      a4 = v28;
      v12 = v30;
    }
    v35 = v14;
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE60F98]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      -[MDMParser _malformedRequestError](self, "_malformedRequestError");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v14;
    }
    else
    {
      v34 = v20;
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE60FC8]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        -[MDMParser _malformedRequestError](self, "_malformedRequestError");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v35;
      }
      else
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE60F80]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          -[MDMParser _malformedRequestError](self, "_malformedRequestError");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v35;
        }
        else
        {
          v29 = v22;
          objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE60F88]);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            -[MDMParser _malformedRequestError](self, "_malformedRequestError");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v35;
          }
          else
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE60FC0]);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              -[MDMParser _malformedRequestError](self, "_malformedRequestError");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v35;
            }
            else
            {
              v37[0] = MEMORY[0x24BDAC760];
              v37[1] = 3221225472;
              v37[2] = __64__MDMParser__performSetAppAttributes_outAdditionalResponseKeys___block_invoke;
              v37[3] = &unk_24EB68B28;
              v38 = v9;
              v39 = v10;
              v40 = v11;
              v41 = v12;
              v42 = v36;
              v43 = v35;
              v44 = v34;
              v45 = v21;
              v46 = v29;
              v47 = v31;
              v48 = v23;
              v24 = a4;
              v25 = v35;
              -[MDMParser _handleSetAppManagementInfoRequest:outAdditionalResponseKeys:block:](self, "_handleSetAppManagementInfoRequest:outAdditionalResponseKeys:block:", v6, v24, v37);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

            }
          }
          v22 = v29;

        }
      }
      v20 = v34;

    }
    goto LABEL_50;
  }
  -[MDMParser _malformedRequestError](self, "_malformedRequestError");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_55:

  return v26;
}

id __64__MDMParser__performSetAppAttributes_outAdditionalResponseKeys___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setBundleIdentifier:", v3);
  objc_msgSend(v4, "setVPNUUIDString:", a1[4]);
  objc_msgSend(v4, "setCellularSliceUUIDString:", a1[5]);
  objc_msgSend(v4, "setContentFilterUUIDString:", a1[6]);
  objc_msgSend(v4, "setDNSProxyUUIDString:", a1[7]);
  objc_msgSend(v4, "setRelayUUIDString:", a1[8]);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setBundleIdentifier:", v3);
  objc_msgSend(v5, "setAssociatedDomains:", a1[9]);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setBundleIdentifier:", v3);
  objc_msgSend(v6, "setAssociatedDomainsEnableDirectDownloads:", a1[10]);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setBundleIdentifier:", v3);
  objc_msgSend(v7, "setTapToPayScreenLock:", a1[11]);
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setBundleIdentifier:", v3);
  objc_msgSend(v8, "setAllowUserToHide:", a1[12]);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setBundleIdentifier:", v3);
  objc_msgSend(v9, "setAllowUserToLock:", a1[13]);
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setBundleIdentifier:", v3);

  objc_msgSend(v10, "setRemovable:", a1[14]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v4)
    objc_msgSend(v11, "addObject:", v4);
  if (v5)
    objc_msgSend(v12, "addObject:", v5);
  if (v6)
    objc_msgSend(v12, "addObject:", v6);
  if (v7)
    objc_msgSend(v12, "addObject:", v7);
  if (v8)
    objc_msgSend(v12, "addObject:", v8);
  if (v9)
    objc_msgSend(v12, "addObject:", v9);
  if (v10)
    objc_msgSend(v12, "addObject:", v10);

  return v12;
}

- (id)_performSetSharedDeviceConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint8_t buf[16];

  v4 = a3;
  v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v5, OS_LOG_TYPE_DEFAULT, "Setting shared device configuration.", buf, 2u);
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("QuotaSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("ResidentUsers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("TemporarySessionOnly"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("PasscodePolicy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("PasscodeLockGracePeriod"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("AutoLockTime"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {
    if (v6)
    {
      -[MDMParser _performSetResidentUserQuotaSize:](self, "_performSetResidentUserQuotaSize:", v4);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
        goto LABEL_18;
    }
    goto LABEL_12;
  }
  if (v6)
  {
    -[MDMParser _performSetResidentUserQuotaSize:](self, "_performSetResidentUserQuotaSize:", v4);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (v7)
  {
    -[MDMParser _performSetResidentUsers:](self, "_performSetResidentUsers:", v4);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v14 = (void *)v13;
    if (v13)
      goto LABEL_19;
  }
LABEL_12:
  -[MDMParser _performSetTemporarySessionOnly:](self, "_performSetTemporarySessionOnly:", v4);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_18;
  -[MDMParser _performSetSessionTimeout:](self, "_performSetSessionTimeout:", v4);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_18;
  -[MDMParser _performSetMAIDDefaultDomains:](self, "_performSetMAIDDefaultDomains:", v4);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12
    || (-[MDMParser _performSetOnlineAuthenticationGracePeriod:](self, "_performSetOnlineAuthenticationGracePeriod:", v4), (v12 = objc_claimAutoreleasedReturnValue()) != 0)|| (-[MDMParser _performSetSkipLanguageAndLocaleSetupForNewUsers:](self, "_performSetSkipLanguageAndLocaleSetupForNewUsers:", v4), (v12 = objc_claimAutoreleasedReturnValue()) != 0)|| (-[MDMParser _performSetAwaitUserConfiguration:](self, "_performSetAwaitUserConfiguration:", v4), (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_18:
    v14 = (void *)v12;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x24BE63C60], "sharedHacks");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "quantizedGracePeriodInSeconds:", v10);
  v26 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValue:forSetting:", v26, *MEMORY[0x24BE63A40]);

  v18 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BE63C60], "sharedHacks");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "quantizedAutoLockInSeconds:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "integerValue");

  v22 = objc_msgSend(v11, "integerValue");
  if (v21 <= v22)
    v23 = v22;
  else
    v23 = v21;
  objc_msgSend(v18, "numberWithInteger:", v23);
  v24 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setValue:forSetting:", v24, *MEMORY[0x24BE637F8]);

  v14 = 0;
  v11 = (void *)v24;
  v10 = (void *)v26;
LABEL_19:

  return v14;
}

- (id)_performSetResidentUsers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v9[16];

  v4 = a3;
  v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_222CB9000, v5, OS_LOG_TYPE_DEFAULT, "Setting resident users for shared device.", v9, 2u);
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("ResidentUsers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MDMParser _setResidentUsersNumber:](self, "_setResidentUsersNumber:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_performSetMaximumResidentUsers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v9[16];

  v4 = a3;
  v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_222CB9000, v5, OS_LOG_TYPE_DEFAULT, "Setting maximum resident users.", v9, 2u);
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("MaximumResidentUsers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MDMParser _setResidentUsersNumber:](self, "_setResidentUsersNumber:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_setResidentUsersNumber:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  if (objc_msgSend(v3, "integerValue") <= 0)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BE2A588];
    v11 = v15;
    v12 = v16;
    v13 = 12092;
    goto LABEL_7;
  }
  if (objc_msgSend(MEMORY[0x24BE2A820], "isFirstSetupBuddyDone"))
  {
    objc_msgSend((id)DMCUMUserManagerClass(), "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allUsers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDD1540];
      v8 = *MEMORY[0x24BE2A728];
      DMCErrorArray();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *MEMORY[0x24BE2A588];
      v11 = v7;
      v12 = v8;
      v13 = 12090;
LABEL_7:
      objc_msgSend(v11, "DMCErrorWithDomain:code:descriptionArray:errorType:", v12, v13, v9, v10, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
  }
  objc_msgSend(MEMORY[0x24BE2A820], "configureResidentUsersNumberForSharedDevice:preferenceDomain:", v3, *MEMORY[0x24BE61040]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v14;
}

- (id)_performSetResidentUserQuotaSize:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[16];

  v3 = a3;
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_DEFAULT, "Setting Shared iPad resident user quota size.", buf, 2u);
  }
  if (objc_msgSend(MEMORY[0x24BE2A820], "isFirstSetupBuddyDone")
    && (objc_msgSend((id)DMCUMUserManagerClass(), "sharedManager"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "allUsers"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v5,
        v7))
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "DMCErrorWithDomain:code:descriptionArray:errorType:", v9, 12090, v10, *MEMORY[0x24BE2A588], 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("QuotaSize"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "integerValue") > 2047)
    {
      v15 = objc_msgSend(v10, "unsignedLongLongValue");
      v16 = (void *)MEMORY[0x24BE2A820];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", 1000000 * v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "configureQuotaSizeForSharedDevice:preferenceDomain:", v14, *MEMORY[0x24BE61040]);
    }
    else
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      v13 = *MEMORY[0x24BE2A728];
      DMCErrorArray();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:errorType:", v13, 12091, v14, *MEMORY[0x24BE2A588], 0);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)_performSetSessionTimeout:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  BOOL v9;
  double v10;
  void *v11;
  void *v12;
  float v13;
  double v14;
  BOOL v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[16];

  v3 = a3;
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_DEFAULT, "Setting Shared iPad session timeout.", buf, 2u);
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("UserSessionTimeout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_11;
  objc_msgSend(v5, "floatValue");
  v8 = v7;
  v9 = v7 >= 30.0 || v7 <= 0.0;
  v10 = 30.0;
  if (v9)
    v10 = v8;
  if ((objc_msgSend(MEMORY[0x24BE2A820], "configureUserSessionTimeout:", v10, v8) & 1) == 0)
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "DMCErrorWithDomain:code:descriptionArray:errorType:", v19, 12093, v12, *MEMORY[0x24BE2A598], 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_11:
    objc_msgSend(v3, "objectForKey:", CFSTR("TemporarySessionTimeout"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
      goto LABEL_19;
    objc_msgSend(v11, "floatValue");
    v14 = v13;
    v15 = v13 >= 30.0 || v13 <= 0.0;
    v16 = 30.0;
    if (v15)
      v16 = v14;
    if ((objc_msgSend(MEMORY[0x24BE2A820], "configureTemporarySessionTimeout:", v16, v14) & 1) == 0)
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      v21 = *MEMORY[0x24BE2A728];
      DMCErrorArray();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "DMCErrorWithDomain:code:descriptionArray:errorType:", v21, 12093, v22, *MEMORY[0x24BE2A598], 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_19:
      v17 = 0;
    }
  }

  return v17;
}

- (id)_performSetTemporarySessionOnly:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[16];

  v3 = a3;
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_DEFAULT, "Setting Shared iPad temporary session only mode.", buf, 2u);
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("TemporarySessionOnly"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("QuotaSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ResidentUsers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 == 0;

  }
  v9 = (void *)MEMORY[0x24BE2A820];
  v10 = objc_msgSend(v5, "BOOLValue");
  if ((objc_msgSend(v9, "configureTemporarySessionOnly:useDynamicQuotaSize:restoreQuotaSizeWhenDisabled:preferenceDomain:", v10, v6 == 0, v7, *MEMORY[0x24BE61040]) & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:errorType:", v13, 12094, v14, *MEMORY[0x24BE2A598], 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)_performSetMAIDDefaultDomains:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[16];

  v3 = a3;
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_DEFAULT, "Setting Shared iPad Managed Apple ID default domain.", buf, 2u);
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ManagedAppleIDDefaultDomains"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x24BE2A820], "configureMAIDDefaultDomains:", v5) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    _os_feature_enabled_impl();
    DMCErrorArray();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x24BE2A728], 12104, v7, *MEMORY[0x24BE2A598], 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_performSetOnlineAuthenticationGracePeriod:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[16];

  v3 = a3;
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_DEFAULT, "Setting Shared iPad online authentication grace period", buf, 2u);
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("OnlineAuthenticationGracePeriod"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x24BE2A820], "configureOnlineAuthenticationGracePeriod:", v5) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "DMCErrorWithDomain:code:descriptionArray:errorType:", v8, 12105, v9, *MEMORY[0x24BE2A598], 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_performSetSkipLanguageAndLocaleSetupForNewUsers:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[16];

  v3 = a3;
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_DEFAULT, "Setting Shared iPad skip language and locale setup for new users", buf, 2u);
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SkipLanguageAndLocaleSetupForNewUsers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x24BE2A820], "configureShouldSkipLanguageAndLocaleSetupForNewUsers:", objc_msgSend(v5, "BOOLValue")) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "DMCErrorWithDomain:code:descriptionArray:errorType:", v8, 12115, v9, *MEMORY[0x24BE2A598], 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_performSetAwaitUserConfiguration:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[16];

  v3 = a3;
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_DEFAULT, "Setting Shared iPad await user configuration", buf, 2u);
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AwaitUserConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x24BE2A820], "configureAwaitUserConfiguration:", v5) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "DMCErrorWithDomain:code:descriptionArray:errorType:", v8, 12123, v9, *MEMORY[0x24BE2A598], 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_performSetDiagnosticSubmission:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a3, "objectForKey:", CFSTR("Enabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  -[MDMParser _setDiagnosticSubmissionEnabled:](self, "_setDiagnosticSubmissionEnabled:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (-[MDMParser _isChlorineEligible](self, "_isChlorineEligible"))
    {
      -[MDMParser _setAppAnalyticsEnabled:](self, "_setAppAnalyticsEnabled:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (id)_setDiagnosticSubmissionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    DMCStringForBool();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl(&dword_222CB9000, v5, OS_LOG_TYPE_DEFAULT, "Setting diagnostic submission allowed: %{public}@", buf, 0xCu);

  }
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setEnabled:", v3);
  objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v9 = (id)objc_msgSend(v8, "performRequest:error:", v7, &v12);
  v10 = v12;

  return v10;
}

- (id)_performSetAppAnalytics:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a3, "objectForKey:", CFSTR("Enabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (!-[MDMParser _isChlorineEligible](self, "_isChlorineEligible"))
  {
LABEL_4:
    -[MDMParser _setAppAnalyticsEnabled:](self, "_setAppAnalyticsEnabled:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  -[MDMParser _setDiagnosticSubmissionEnabled:](self, "_setDiagnosticSubmissionEnabled:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (!-[MDMParser _isChlorineEligible](self, "_isChlorineEligible"))
    {
      v6 = 0;
      return v6;
    }
    goto LABEL_4;
  }
  return v6;
}

- (id)_setAppAnalyticsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    DMCStringForBool();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl(&dword_222CB9000, v5, OS_LOG_TYPE_DEFAULT, "Setting app analytics allowed: %{public}@", buf, 0xCu);

  }
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setEnabled:", v3);
  objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v9 = (id)objc_msgSend(v8, "performRequest:error:", v7, &v12);
  v10 = v12;

  return v10;
}

- (id)_performSetGracePeriod:(id)a3
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKey:", CFSTR("PasscodeLockGracePeriod"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)buf = 67109120;
    v13 = objc_msgSend(v3, "intValue");
    _os_log_impl(&dword_222CB9000, v5, OS_LOG_TYPE_DEFAULT, "Setting grace period: %d seconds", buf, 8u);

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setSeconds:", (double)(unint64_t)objc_msgSend(v3, "unsignedIntegerValue"));
  objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v8 = (id)objc_msgSend(v7, "performRequest:error:", v6, &v11);
  v9 = v11;

  return v9;
}

- (id)_performSetOrganizationInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("OrganizationInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (_performSetOrganizationInfo__onceToken != -1)
      dispatch_once(&_performSetOrganizationInfo__onceToken, &__block_literal_global_791);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = (id)_performSetOrganizationInfo__validKeys;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v12, (_QWORD)v21);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13 && objc_msgSend(v13, "length"))
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    v15 = objc_msgSend(v6, "count");
    -[MDMParser server](self, "server");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
      v18 = v6;
    else
      v18 = 0;
    objc_msgSend(v16, "setOrganizationInfo:", v18, (_QWORD)v21);

  }
  else
  {
    -[MDMParser server](self, "server");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setOrganizationInfo:", 0);

  }
  return 0;
}

void __41__MDMParser__performSetOrganizationInfo___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE2A4C8];
  v5[0] = *MEMORY[0x24BE2A4B8];
  v5[1] = v0;
  v1 = *MEMORY[0x24BE2A4C0];
  v5[2] = *MEMORY[0x24BE2A4A0];
  v5[3] = v1;
  v2 = *MEMORY[0x24BE2A4B0];
  v5[4] = *MEMORY[0x24BE2A4A8];
  v5[5] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_performSetOrganizationInfo__validKeys;
  _performSetOrganizationInfo__validKeys = v3;

}

- (id)_performSetMDMOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MDMOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE60DB0], "validatedMDMOptionsFromOptionsDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMParser server](self, "server");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMDMOptions:", v5);

  return 0;
}

- (id)_performSetTimezone:(id)a3
{
  id v3;
  unsigned int v4;
  unsigned int v5;
  NSObject *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  unsigned int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TimeZone"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "UTF8String");
  v4 = tzlink();
  if (v4)
  {
    v5 = v4;
    v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v18 = v3;
      v19 = 1024;
      v20 = v5;
      _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_ERROR, "Failed to set timezone to %{public}@ with error code %d", buf, 0x12u);
    }
    v7 = v5 > 0x2D || ((1 << v5) & 0x200000000022) == 0;
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BE2A6B8];
    if (v7)
    {
      DMCErrorArray();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *MEMORY[0x24BE2A588];
      v12 = v8;
      v13 = v9;
      v14 = 28004;
    }
    else
    {
      DMCErrorArray();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *MEMORY[0x24BE2A588];
      v12 = v8;
      v13 = v9;
      v14 = 28005;
    }
    objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:errorType:", v13, v14, v10, v11, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    TMSetAutomaticTimeZoneEnabled();
    v15 = 0;
  }

  return v15;
}

- (id)_performSetAccessibilitySettings:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  NSObject *log;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend((id)objc_opt_class(), "_allAccessibilitySettingsKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v17;
    *(_QWORD *)&v6 = 138543362;
    v14 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v10, v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          +[MDMAccessibilityManager sharedInstance](MDMAccessibilityManager, "sharedInstance");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("ZoomEnabled")))
          {
            objc_msgSend(v12, "setZoomEnabled:", objc_msgSend(v11, "BOOLValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("BoldTextEnabled")))
          {
            objc_msgSend(v12, "setBoldTextEnabled:", objc_msgSend(v11, "BOOLValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("VoiceOverEnabled")))
          {
            objc_msgSend(v12, "setVoiceOverEnabled:", objc_msgSend(v11, "BOOLValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("ReduceMotionEnabled")))
          {
            objc_msgSend(v12, "setReduceMotionEnabled:", objc_msgSend(v11, "BOOLValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("IncreaseContrastEnabled")))
          {
            objc_msgSend(v12, "setIncreaseContrastEnabled:", objc_msgSend(v11, "BOOLValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("TouchAccommodationsEnabled")))
          {
            objc_msgSend(v12, "setTouchAccommodationsEnabled:", objc_msgSend(v11, "BOOLValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("ReduceTransparencyEnabled")))
          {
            objc_msgSend(v12, "setReduceTransparencyEnabled:", objc_msgSend(v11, "BOOLValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("GrayscaleEnabled")))
          {
            objc_msgSend(v12, "setGrayscaleEnabled:", objc_msgSend(v11, "BOOLValue"));
          }
          else if (objc_msgSend(v10, "isEqualToString:", CFSTR("TextSize")))
          {
            objc_msgSend(v12, "setTextSize:", objc_msgSend(v11, "integerValue"));
          }
          else
          {
            log = *(NSObject **)(DMCLogObjects() + 8);
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v14;
              v21 = v10;
              _os_log_impl(&dword_222CB9000, log, OS_LOG_TYPE_ERROR, "Ignoring unsupported accessibility key: %{public}@", buf, 0xCu);
            }
          }

        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v7);
  }

  return 0;
}

+ (id)_numericAccessibilitySettingsKeys
{
  if (_numericAccessibilitySettingsKeys_onceToken != -1)
    dispatch_once(&_numericAccessibilitySettingsKeys_onceToken, &__block_literal_global_797);
  return (id)_numericAccessibilitySettingsKeys_numericKeys;
}

void __46__MDMParser__numericAccessibilitySettingsKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[10];

  v2[9] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("ZoomEnabled");
  v2[1] = CFSTR("BoldTextEnabled");
  v2[2] = CFSTR("VoiceOverEnabled");
  v2[3] = CFSTR("ReduceMotionEnabled");
  v2[4] = CFSTR("IncreaseContrastEnabled");
  v2[5] = CFSTR("TouchAccommodationsEnabled");
  v2[6] = CFSTR("ReduceTransparencyEnabled");
  v2[7] = CFSTR("GrayscaleEnabled");
  v2[8] = CFSTR("TextSize");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_numericAccessibilitySettingsKeys_numericKeys;
  _numericAccessibilitySettingsKeys_numericKeys = v0;

}

- (id)_performSetting:(id)a3 outAdditionalResponseKeys:(id *)a4 outRestartAppleTVApp:(BOOL *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  uint64_t v13;
  void *v14;

  v7 = a3;
  objc_msgSend(v7, "objectForKey:", CFSTR("Item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("DeviceName")))
  {
    -[MDMParser _performSetDeviceName:](self, "_performSetDeviceName:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Wallpaper")))
  {
    -[MDMParser _performSetWallpaper:](self, "_performSetWallpaper:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("DataRoaming")))
  {
    -[MDMParser _performSetDataRoaming:](self, "_performSetDataRoaming:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("VoiceRoaming")))
  {
    -[MDMParser _performSetVoiceRoaming:](self, "_performSetVoiceRoaming:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Bluetooth")))
  {
    -[MDMParser _performSetBluetooth:](self, "_performSetBluetooth:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("PersonalHotspot")))
  {
    -[MDMParser _performSetPersonalHotspot:](self, "_performSetPersonalHotspot:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("ApplicationConfiguration")))
  {
    -[MDMParser _performSetAppConfig:outAdditionalResponseKeys:](self, "_performSetAppConfig:outAdditionalResponseKeys:", v7, a4);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("ApplicationAttributes")))
  {
    -[MDMParser _performSetAppAttributes:outAdditionalResponseKeys:](self, "_performSetAppAttributes:outAdditionalResponseKeys:", v7, a4);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MaximumResidentUsers")))
  {
    -[MDMParser _performSetMaximumResidentUsers:](self, "_performSetMaximumResidentUsers:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("SoftwareUpdateSettings")))
  {
    -[MDMParser _performSetUpdatePath:](self, "_performSetUpdatePath:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("SharedDeviceConfiguration")))
  {
    -[MDMParser _performSetSharedDeviceConfiguration:](self, "_performSetSharedDeviceConfiguration:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("DiagnosticSubmission")))
  {
    -[MDMParser _performSetDiagnosticSubmission:](self, "_performSetDiagnosticSubmission:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("AppAnalytics")))
  {
    -[MDMParser _performSetAppAnalytics:](self, "_performSetAppAnalytics:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("PasscodeLockGracePeriod")))
  {
    -[MDMParser _performSetGracePeriod:](self, "_performSetGracePeriod:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("OrganizationInfo")))
  {
    -[MDMParser _performSetOrganizationInfo:](self, "_performSetOrganizationInfo:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("MDMOptions")))
  {
    -[MDMParser _performSetMDMOptions:](self, "_performSetMDMOptions:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("TimeZone")))
  {
    -[MDMParser _performSetTimezone:](self, "_performSetTimezone:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("AccessibilitySettings")))
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      v13 = *MEMORY[0x24BE2A6B8];
      DMCErrorArray();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:errorType:", v13, 28000, v14, *MEMORY[0x24BE2A588], v8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_38;
    }
    -[MDMParser _performSetAccessibilitySettings:](self, "_performSetAccessibilitySettings:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_38:

  return v10;
}

- (id)_settings:(id)a3 accessRights:(unint64_t)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id obj;
  MDMParser *v27;
  uint8_t buf[16];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKey:", CFSTR("Settings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v25 = v5;
    v7 = v5;
    v8 = (void *)v6;
    obj = v7;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v33;
      v27 = self;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v33 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("CommandFormatError"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_29;
          }
          objc_msgSend(v13, "objectForKey:", CFSTR("Item"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = v8;
            v31 = 0;
            v16 = -[MDMParser _validateSetting:accessRights:outError:](self, "_validateSetting:accessRights:outError:", v13, a4, &v31);
            v17 = v31;
            if (v16)
            {
              buf[0] = 0;
              v30 = 0;
              -[MDMParser _performSetting:outAdditionalResponseKeys:outRestartAppleTVApp:](self, "_performSetting:outAdditionalResponseKeys:outRestartAppleTVApp:", v13, &v30, buf);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v30;

              if (v18)
                +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v18);
              else
                +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              if (v17)
              {
                +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v17);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("CommandFormatError"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v19 = 0;
            }
            v8 = v15;
            objc_msgSend(v21, "setObject:forKey:", v14, CFSTR("Item"), v25);
            if (v19)
              objc_msgSend(v21, "addEntriesFromDictionary:", v19);
            objc_msgSend(v15, "addObject:", v21);

            self = v27;
          }
          else
          {
            v20 = *(NSObject **)(DMCLogObjects() + 8);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_222CB9000, v20, OS_LOG_TYPE_ERROR, "Ignoring setting command missing the Item key", buf, 2u);
            }
          }

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v10)
          continue;
        break;
      }
    }

    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "mutableCopy");

    objc_msgSend(v23, "setObject:forKey:", v8, CFSTR("Settings"));
LABEL_29:

    v5 = v25;
  }
  else
  {
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("CommandFormatError"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (id)_appStoreDisabledError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12031, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_stringForBookState:(unint64_t)a3
{
  if (a3 - 1 > 8)
    return CFSTR("Unknown");
  else
    return off_24EB68EF0[a3 - 1];
}

+ (id)_stringForAppState:(unint64_t)a3
{
  if (a3 > 0x12)
    return CFSTR("Unknown");
  else
    return off_24EB68F38[a3];
}

- (id)_appAlreadyInstalledErrorWithBundleID:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 12025, v5, *MEMORY[0x24BE2A588], a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_appAlreadyInstalledErrorWithiTunesStoreID:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BE2A728];
  objc_msgSend(a3, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DMCErrorArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 12025, v6, *MEMORY[0x24BE2A588], v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_appAlreadyQueuedErrorWithBundleID:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 12026, v5, *MEMORY[0x24BE2A588], a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_appAlreadyQueuedErrorWithiTunesStoreID:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BE2A728];
  objc_msgSend(a3, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DMCErrorArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 12026, v6, *MEMORY[0x24BE2A588], v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_licenseNotFoundErrorWithBundleID:(id)a3 underlyingError:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v11;

  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BE2A728];
  v7 = a4;
  v11 = a3;
  DMCErrorArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v6, 12064, v8, v7, *MEMORY[0x24BE2A588], v11, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_licenseNotFoundErrorWithiTunesStoreID:(id)a3 underlyingError:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BE2A728];
  v7 = a4;
  objc_msgSend(a3, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  DMCErrorArray();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v6, 12064, v9, v7, *MEMORY[0x24BE2A588], v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_cannotValidateAppIDErrorUnderlyingError:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BE2A728];
  v5 = a3;
  DMCErrorArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 12023, v6, v5, *MEMORY[0x24BE2A588], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_invalidManifestErrorWithURL:(id)a3 underlyingError:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x24BDD1808];
  v6 = a4;
  objc_msgSend(v5, "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setQuery:", 0);
  v8 = (void *)MEMORY[0x24BDD1540];
  v9 = *MEMORY[0x24BE2A728];
  objc_msgSend(v7, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  DMCErrorArray();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v9, 12024, v11, v6, *MEMORY[0x24BE2A588], v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_installApplication:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void (**v17)(id, void *);
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  unsigned int v39;
  void *v40;
  int v41;
  void (**v42)(id, void *);
  id v43;
  uint64_t v44;
  void (**v45)(_QWORD);
  void *v46;
  BOOL v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  unsigned int v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  _QWORD v68[5];
  id v69;
  void (**v70)(_QWORD);
  void (**v71)(id, void *);
  _QWORD v72[5];
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  void (**v82)(id, void *);
  unsigned int v83;
  _QWORD v84[5];
  id v85;
  void (**v86)(id, void *);
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[MDMParser server](self, "server");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isAppInstallBlocked");

  if (v12)
  {
    v13 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v13, OS_LOG_TYPE_DEFAULT, "Application installs are blocked, returning NotNow for InstallApplication.", buf, 2u);
    }
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("NotNow"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MDMParser _sendAnalyticsMDMCommandEventWithRequest:response:](self, "_sendAnalyticsMDMCommandEventWithRequest:response:", v8, v14);
    if (v10)
      v10[2](v10, v14);
    goto LABEL_41;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ManifestURL"));
  v15 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v15;
  if (!v15
    || (objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v15), (v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v60 = v9;
    v61 = (void *)v15;
    v84[0] = MEMORY[0x24BDAC760];
    v84[1] = 3221225472;
    v84[2] = __59__MDMParser__installApplication_assertion_completionBlock___block_invoke;
    v84[3] = &unk_24EB68B90;
    v84[4] = self;
    v16 = v8;
    v85 = v16;
    v17 = v10;
    v86 = v17;
    v59 = MEMORY[0x22767CBAC](v84);
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Identifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("iTunesStoreID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Options"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Attributes"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Configuration"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ManagementFlags"));
    v66 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ChangeManagementState"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "personaID");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v19 != 0;
    if (v19)
      v23 = 2;
    else
      v23 = 1;
    if (v14)
      v22 = v23;
    v67 = (void *)v18;
    if (v18)
      ++v22;
    if (v22 != 1
      || v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v66 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v65 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v64 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v31 = (void *)v59;
      (*(void (**)(uint64_t, _QWORD))(v59 + 16))(v59, 0);
LABEL_36:
      v32 = v61;
      v25 = v65;
LABEL_37:

      v9 = v60;
      goto LABEL_41;
    }
    -[MDMParser _appManagementFlagsWithRequestedFlags:](self, "_appManagementFlagsWithRequestedFlags:", v66);
    v24 = objc_claimAutoreleasedReturnValue();

    -[MDMParser _appAttributesWithRequestedAttributes:](self, "_appAttributesWithRequestedAttributes:", v20);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = v65;
    if (v65)
    {
      objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("NotManaged"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("PurchaseMethod"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || v27 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v29 = v26;
        v30 = (void *)v24;
        v31 = (void *)v59;
        (*(void (**)(uint64_t, _QWORD))(v59 + 16))(v59, 0);
        goto LABEL_44;
      }
      v28 = objc_msgSend(v27, "intValue");
      if (v28 >= 2)
      {
        v29 = v26;
        v30 = (void *)v24;
        v31 = (void *)v59;
        (*(void (**)(uint64_t, const __CFString *))(v59 + 16))(v59, CFSTR("PurchaseMethodNotSupported"));
LABEL_44:

        v66 = v30;
        v20 = v57;
        goto LABEL_36;
      }
      v66 = (id)v24;
      v39 = v28;

      v38 = v39;
      v25 = v65;
    }
    else
    {
      v66 = (id)v24;
      v38 = 0;
    }
    if (!v14 && !v38 && objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad"))
    {
      v31 = (void *)v59;
      (*(void (**)(uint64_t, const __CFString *))(v59 + 16))(v59, CFSTR("PurchaseMethodNotSupportedInMultiUser"));
LABEL_54:
      v20 = v57;
      v32 = v61;
      goto LABEL_37;
    }
    v55 = v38;
    if (v64)
    {
      if ((objc_msgSend(v64, "isEqualToString:", CFSTR("Managed")) & 1) == 0
        || (objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration"),
            v40 = (void *)objc_claimAutoreleasedReturnValue(),
            v41 = objc_msgSend(v40, "isUserEnrollment"),
            v40,
            v25 = v65,
            v41))
      {
        v31 = (void *)v59;
        (*(void (**)(uint64_t, const __CFString *))(v59 + 16))(v59, CFSTR("ManagementChangeNotSupported"));
        goto LABEL_54;
      }
    }
    v72[0] = MEMORY[0x24BDAC760];
    v72[1] = 3221225472;
    v72[2] = __59__MDMParser__installApplication_assertion_completionBlock___block_invoke_2;
    v72[3] = &unk_24EB68BB8;
    v72[4] = self;
    v54 = v16;
    v73 = v54;
    v42 = v17;
    v82 = v42;
    v32 = v61;
    v43 = v61;
    v74 = v43;
    v75 = v19;
    v76 = v67;
    v66 = v66;
    v77 = v66;
    v58 = v57;
    v78 = v58;
    v79 = v63;
    v80 = v64;
    v83 = v55;
    v81 = v62;
    v44 = MEMORY[0x22767CBAC](v72);
    v45 = (void (**)(_QWORD))v44;
    if (v43)
    {
      (*(void (**)(uint64_t))(v44 + 16))(v44);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = -[MDMParser _isPurchaseMethodAllowed:onUserEnrollment:](self, "_isPurchaseMethodAllowed:onUserEnrollment:", v55, objc_msgSend(v46, "isUserEnrollment"));

      if (!v47)
      {
        if (objc_msgSend(MEMORY[0x24BE2A818], "isAppleTV"))
          v48 = CFSTR("NotSupportedOnAppleTV");
        else
          v48 = CFSTR("PurchaseMethodNotSupported");
        v31 = (void *)v59;
        (*(void (**)(uint64_t, const __CFString *))(v59 + 16))(v59, v48);
        v32 = v61;
        goto LABEL_58;
      }
      if (v55 == 1)
      {
        v45[2](v45);
        v32 = v61;
      }
      else
      {
        DMCLocalizedString();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[MDMParser server](self, "server");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "organizationName");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50)
        {
          v52 = v50;
          DMCLocalizedFormat();
          v53 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[MDMParser server](self, "server");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "serverName");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          DMCLocalizedFormat();
          v53 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v32 = v61;
        v68[0] = MEMORY[0x24BDAC760];
        v68[1] = 3221225472;
        v68[2] = __59__MDMParser__installApplication_assertion_completionBlock___block_invoke_4;
        v68[3] = &unk_24EB68BE0;
        v70 = v45;
        v68[4] = self;
        v69 = v54;
        v71 = v42;
        +[MDMManagedAssetManager promptUserToLoginToiTunesIfNeededTitle:message:assertion:completionBlock:](MDMManagedAssetManager, "promptUserToLoginToiTunesIfNeededTitle:message:assertion:completionBlock:", v56, v53, v60, v68, v52);

      }
    }
    v31 = (void *)v59;
LABEL_58:
    v25 = v65;

    v20 = v58;
    goto LABEL_37;
  }
  v33 = (void *)MEMORY[0x24BDD1540];
  v34 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "DMCErrorWithDomain:code:descriptionArray:errorType:", v34, 12030, v35, *MEMORY[0x24BE2A588], 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMParser _sendAnalyticsMDMCommandEventWithRequest:response:](self, "_sendAnalyticsMDMCommandEventWithRequest:response:", v8, v37);
  if (v10)
    v10[2](v10, v37);

LABEL_41:
}

void __59__MDMParser__installApplication_assertion_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, CFSTR("RejectionReason"));
  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(_QWORD *)(a1 + 40), v6);
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

void __59__MDMParser__installApplication_assertion_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__MDMParser__installApplication_assertion_completionBlock___block_invoke_3;
  v5[3] = &unk_24EB689E0;
  v2 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v2;
  v7 = *(id *)(a1 + 112);
  v3 = (void *)MEMORY[0x22767CBAC](v5);
  LODWORD(v4) = *(_DWORD *)(a1 + 120);
  objc_msgSend(*(id *)(a1 + 32), "_performInstallApplicationRequestWithManifestURL:iTunesStoreIDObj:bundleId:flagsObj:attributes:configuration:manageChangeStr:purchaseMethodValue:personaID:completionBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), v4, *(_QWORD *)(a1 + 104), v3);

}

void __59__MDMParser__installApplication_assertion_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __59__MDMParser__installApplication_assertion_completionBlock___block_invoke_4(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDD1540];
    v4 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 12040, v5, *MEMORY[0x24BE2A588], 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(_QWORD *)(a1 + 40), v6);
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);

  }
}

- (void)_performInstallApplicationRequestWithManifestURL:(id)a3 iTunesStoreIDObj:(id)a4 bundleId:(id)a5 flagsObj:(id)a6 attributes:(id)a7 configuration:(id)a8 manageChangeStr:(id)a9 purchaseMethodValue:(int)a10 personaID:(id)a11 completionBlock:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  MDMParser *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  int v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x24BDAC8D0];
  v34 = a3;
  v17 = a4;
  v33 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a11;
  v23 = a12;
  objc_msgSend(MEMORY[0x24BE2C7E0], "currentUserConnection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke;
  v42[3] = &unk_24EB68CA8;
  v43 = v34;
  v44 = v17;
  v52 = v21;
  v53 = v23;
  v45 = v33;
  v46 = v24;
  v47 = self;
  v48 = v18;
  v49 = v19;
  v50 = v22;
  v54 = a10;
  v51 = v20;
  v41 = v21;
  v40 = v20;
  v39 = v22;
  v38 = v19;
  v37 = v18;
  v25 = v24;
  v36 = v23;
  v26 = v33;
  v27 = v17;
  v28 = v34;
  +[MDMBlockOperation blockOperationWithBlock:](MDMBlockOperation, "blockOperationWithBlock:", v42);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "batchOperationToPerformOperations:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "setName:", CFSTR("InstallApplication"));
  -[MDMParser operationQueue](self, "operationQueue");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addOperation:", v31);

}

void __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  int v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  _QWORD v30[7];

  v30[6] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setType:", 3);
  objc_msgSend(v4, "setManifestURL:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setStoreItemIdentifier:", *(_QWORD *)(a1 + 40));
  v30[0] = CFSTR("bundleIdentifier");
  v30[1] = CFSTR("type");
  v30[2] = CFSTR("installationState");
  v30[3] = CFSTR("isAppClip");
  v30[4] = CFSTR("managementInformation");
  v30[5] = CFSTR("sourceIdentifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertyKeys:", v5);

  if (*(_QWORD *)(a1 + 48))
  {
    v29 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBundleIdentifiers:", v6);

  }
  v7 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_2;
  v26[3] = &unk_24EB689B8;
  v8 = *(id *)(a1 + 112);
  v27 = v3;
  v28 = v8;
  v9 = v3;
  v10 = (void *)MEMORY[0x22767CBAC](v26);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_3;
  v14[3] = &unk_24EB68C80;
  v12 = *(void **)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v24 = v10;
  v14[4] = v11;
  v15 = *(id *)(a1 + 72);
  v16 = *(id *)(a1 + 80);
  v17 = *(id *)(a1 + 48);
  v18 = *(id *)(a1 + 40);
  v19 = *(id *)(a1 + 32);
  v20 = *(id *)(a1 + 88);
  v21 = *(id *)(a1 + 96);
  v25 = *(_DWORD *)(a1 + 120);
  v22 = *(id *)(a1 + 56);
  v23 = *(id *)(a1 + 104);
  v13 = v10;
  objc_msgSend(v12, "performRequest:completion:", v4, v14);

}

uint64_t __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "endBlockOperation");
}

void __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  BOOL v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void (*v51)(uint64_t, void *);
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void (*v57)(uint64_t, void *);
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void (*v64)(uint64_t, void *);
  uint64_t v65;
  uint64_t v66;
  void (*v67)(uint64_t, void *);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t);
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(uint64_t);
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  char v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  _BOOL8 v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  _QWORD v121[4];
  id v122;
  id v123;
  _QWORD v124[4];
  id v125;
  id v126;
  _QWORD v127[4];
  id v128;
  id v129;
  uint64_t v130;
  id v131;
  id v132;
  id v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _QWORD v138[4];
  id v139;
  _BYTE v140[128];
  uint64_t v141;

  v141 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (!a3)
  {
    v138[0] = MEMORY[0x24BDAC760];
    v138[1] = 3221225472;
    v138[2] = __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_4;
    v138[3] = &unk_24EB68C08;
    v139 = *(id *)(a1 + 112);
    v8 = (void *)MEMORY[0x22767CBAC](v138);
    objc_msgSend(v5, "appsByBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sourceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = *(_QWORD *)(a1 + 112);
      objc_msgSend(*(id *)(a1 + 32), "_installApplicationCouldNotModifyDDMAppsError");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v15);
LABEL_68:

      goto LABEL_69;
    }
    objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "personaID");
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(*(id *)(a1 + 40), "intValue");
    v19 = (v18 & 1 | (unint64_t)v17) != 0;
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BE60FD0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v42 = *(_QWORD *)(a1 + 112);
        objc_msgSend(*(id *)(a1 + 32), "_malformedRequestError");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v42 + 16))(v42, v20);
LABEL_67:

        goto LABEL_68;
      }
    }
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BE60FA0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v43 = *(_QWORD *)(a1 + 112);
        objc_msgSend(*(id *)(a1 + 32), "_malformedRequestError");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v43 + 16))(v43, v21);
LABEL_66:

        goto LABEL_67;
      }
    }
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BE60FA8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v44 = *(_QWORD *)(a1 + 112);
        objc_msgSend(*(id *)(a1 + 32), "_malformedRequestError");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v44 + 16))(v44, v22);
LABEL_65:

        goto LABEL_66;
      }
    }
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BE60FB0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v45 = *(_QWORD *)(a1 + 112);
      objc_msgSend(*(id *)(a1 + 32), "_malformedRequestError");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v22);
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = *(void (**)(uint64_t, uint64_t))(v45 + 16);
      v48 = v45;
      v23 = (void *)v46;
      v47(v48, v46);
    }
    else
    {
      v110 = v19;
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BE60FB8]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v120 = v21;
        v49 = *(_QWORD *)(a1 + 112);
        objc_msgSend(*(id *)(a1 + 32), "_malformedRequestError");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v23);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = *(void (**)(uint64_t, void *))(v49 + 16);
        v52 = v49;
        v21 = v120;
        v51(v52, v50);

      }
      else
      {
        v104 = v18;
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BE60F90]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v23)
          goto LABEL_26;
        v108 = v20;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v113 = v22;
          v118 = v21;
          v102 = v8;
          v136 = 0u;
          v137 = 0u;
          v134 = 0u;
          v135 = 0u;
          v99 = v23;
          v24 = v23;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v134, v140, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v135;
            while (2)
            {
              for (i = 0; i != v26; ++i)
              {
                if (*(_QWORD *)v135 != v27)
                  objc_enumerationMutation(v24);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v59 = *(_QWORD *)(a1 + 112);
                  objc_msgSend(*(id *)(a1 + 32), "_malformedRequestError");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v60);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  (*(void (**)(uint64_t, void *))(v59 + 16))(v59, v61);

                  v23 = v24;
                  v8 = v102;
                  v20 = v108;
                  v22 = v113;
                  v21 = v118;
                  goto LABEL_64;
                }
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v134, v140, 16);
              if (v26)
                continue;
              break;
            }
          }

          v8 = v102;
          v20 = v108;
          v21 = v118;
          v23 = v99;
LABEL_26:
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BE60F98]);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v115 = v22;
              v62 = *(_QWORD *)(a1 + 112);
              objc_msgSend(*(id *)(a1 + 32), "_malformedRequestError");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = *(void (**)(uint64_t, void *))(v62 + 16);
              v65 = v62;
              v22 = v115;
              v64(v65, v63);
LABEL_63:

              goto LABEL_64;
            }
          }
          v101 = v29;
          objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BE60FC8]);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          if (v103 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            v116 = v22;
            v66 = *(_QWORD *)(a1 + 112);
            objc_msgSend(*(id *)(a1 + 32), "_malformedRequestError");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v63);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = *(void (**)(uint64_t, void *))(v66 + 16);
            v68 = v66;
            v22 = v116;
            v67(v68, v31);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BE60F80]);
            v30 = objc_claimAutoreleasedReturnValue();
            v119 = v21;
            if (!v30 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v96 = (void *)v30;
              objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BE60F88]);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (v31)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v106 = v31;
                  v73 = v22;
                  v74 = *(_QWORD *)(a1 + 112);
                  objc_msgSend(*(id *)(a1 + 32), "_malformedRequestError");
                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                  +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:");
                  v75 = objc_claimAutoreleasedReturnValue();
                  v76 = *(void (**)(uint64_t))(v74 + 16);
                  v77 = v74;
                  v22 = v73;
                  v31 = v106;
                  v112 = (void *)v75;
                  v76(v77);
                  v63 = v96;

LABEL_61:
                  goto LABEL_62;
                }
              }
              v100 = v23;
              v114 = v22;
              objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BE60FC0]);
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              if (v97)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v78 = *(_QWORD *)(a1 + 112);
                  objc_msgSend(*(id *)(a1 + 32), "_malformedRequestError");
                  v111 = (void *)objc_claimAutoreleasedReturnValue();
                  +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:");
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  (*(void (**)(uint64_t))(v78 + 16))(v78);
                  v22 = v114;
                  goto LABEL_59;
                }
              }
              objc_msgSend(*(id *)(a1 + 32), "_originator", v104 & 0xE | (unint64_t)v110);
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "appsByBundleIdentifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "allValues");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "firstObject");
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              v35 = v34;
              v36 = objc_msgSend(v34, "type");
              v109 = v20;
              v95 = v35;
              if ((unint64_t)objc_msgSend(v35, "installationState") < 4
                || objc_msgSend(v35, "isAppClip"))
              {
                v37 = (void *)objc_opt_new();
                objc_msgSend(v37, "setBundleIdentifier:", *(_QWORD *)(a1 + 56));
                objc_msgSend(v37, "setStoreItemIdentifier:", *(_QWORD *)(a1 + 64));
                objc_msgSend(v37, "setManifestURL:", *(_QWORD *)(a1 + 72));
                objc_msgSend(v37, "setOriginator:", v111);
                objc_msgSend(v37, "setPersonaIdentifier:", *(_QWORD *)(a1 + 80));
                objc_msgSend(MEMORY[0x24BE2A7F0], "mdmAppInstallationSourceIdentifierWithDefaultValue:", 0);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "setSourceIdentifier:", v38);

                v39 = v36 == 1;
                v21 = v119;
                v23 = v100;
                if (!v39)
                {
                  objc_msgSend(v37, "setManage:", 1);
                  objc_msgSend(v37, "setManagementOptions:", v94);
                  objc_msgSend(v37, "setVPNUUIDString:", v14);
                  objc_msgSend(v37, "setCellularSliceUUIDString:", v15);
                  objc_msgSend(v37, "setContentFilterUUIDString:", v109);
                  objc_msgSend(v37, "setDNSProxyUUIDString:", v119);
                  objc_msgSend(v37, "setRelayUUIDString:", v114);
                  objc_msgSend(v37, "setAssociatedDomains:", v100);
                  objc_msgSend(v37, "setAssociatedDomainsEnableDirectDownloads:", v101);
                  objc_msgSend(v37, "setTapToPayScreenLock:", v103);
                  objc_msgSend(v37, "setAllowUserToHide:", v96);
                  objc_msgSend(v37, "setAllowUserToLock:", v31);
                  objc_msgSend(v37, "setRemovable:", v97);
                  objc_msgSend(v37, "setConfiguration:", *(_QWORD *)(a1 + 88));
                }
                if (objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad"))
                {
                  v40 = v37;
                  v41 = 1;
                }
                else
                {
                  if (!*(_DWORD *)(a1 + 120))
                  {
                    objc_msgSend(v37, "setLicenseType:", 2);
                    objc_msgSend(v37, "setAllowFreePurchases:", 1);
                    goto LABEL_57;
                  }
                  v40 = v37;
                  v41 = 3;
                }
                objc_msgSend(v40, "setLicenseType:", v41);
LABEL_57:
                v79 = *(void **)(a1 + 96);
                v127[0] = MEMORY[0x24BDAC760];
                v127[1] = 3221225472;
                v127[2] = __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_5;
                v127[3] = &unk_24EB68C30;
                v132 = v8;
                v128 = *(id *)(a1 + 56);
                v80 = *(id *)(a1 + 64);
                v81 = *(_QWORD *)(a1 + 32);
                v129 = v80;
                v130 = v81;
                v131 = *(id *)(a1 + 72);
                v133 = *(id *)(a1 + 112);
                objc_msgSend(v79, "performRequest:completion:", v37, v127);

                v22 = v114;
LABEL_58:

                v20 = v109;
LABEL_59:
                v63 = v96;

                goto LABEL_61;
              }
              if (objc_msgSend(*(id *)(a1 + 32), "_isManagedApp:", v35))
              {
                v107 = v31;
                v82 = v20;
                v37 = (void *)objc_opt_new();
                objc_msgSend(v37, "setBundleIdentifier:", *(_QWORD *)(a1 + 56));
                objc_msgSend(v37, "setStoreItemIdentifier:", *(_QWORD *)(a1 + 64));
                objc_msgSend(v37, "setManifestURL:", *(_QWORD *)(a1 + 72));
                objc_msgSend(v37, "setOriginator:", v111);
                objc_msgSend(v37, "setPersonaIdentifier:", *(_QWORD *)(a1 + 80));
                objc_msgSend(v37, "setManagementOptions:", v94);
                objc_msgSend(v37, "setVPNUUIDString:", v14);
                objc_msgSend(v37, "setCellularSliceUUIDString:", v15);
                v21 = v119;
                objc_msgSend(v37, "setContentFilterUUIDString:", v82);
                objc_msgSend(v37, "setDNSProxyUUIDString:", v119);
                objc_msgSend(v37, "setRelayUUIDString:", v114);
                v23 = v100;
                objc_msgSend(v37, "setAssociatedDomains:", v100);
                objc_msgSend(v37, "setAssociatedDomainsEnableDirectDownloads:", v101);
                objc_msgSend(v37, "setTapToPayScreenLock:", v103);
                objc_msgSend(v37, "setAllowUserToHide:", v96);
                objc_msgSend(v37, "setAllowUserToLock:", v107);
                objc_msgSend(v37, "setRemovable:", v97);
                objc_msgSend(v37, "setConfiguration:", *(_QWORD *)(a1 + 88));
                v83 = *(void **)(a1 + 96);
                v124[0] = MEMORY[0x24BDAC760];
                v124[1] = 3221225472;
                v124[2] = __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_6;
                v124[3] = &unk_24EB68C58;
                v125 = v8;
                v126 = *(id *)(a1 + 112);
                v84 = v83;
                v22 = v114;
                v31 = v107;
                objc_msgSend(v84, "performRequest:completion:", v37, v124);

                v85 = v125;
LABEL_72:

                goto LABEL_58;
              }
              if (v36 == 1 || !*(_QWORD *)(a1 + 104))
              {
                +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Error"));
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "setObject:forKeyedSubscript:", CFSTR("AppAlreadyInstalled"), CFSTR("RejectionReason"));
                if (*(_QWORD *)(a1 + 64))
                {
                  objc_msgSend(*(id *)(a1 + 32), "_appAlreadyInstalledErrorWithiTunesStoreID:");
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "setObject:forKeyedSubscript:", v88, CFSTR("ErrorObject"));
                }
                else
                {
                  v89 = *(void **)(a1 + 56);
                  if (v89)
                  {
                    v90 = v89;
                  }
                  else
                  {
                    objc_msgSend(v35, "bundleIdentifier");
                    v90 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  v88 = v90;
                  objc_msgSend(*(id *)(a1 + 32), "_appAlreadyInstalledErrorWithBundleID:", v90);
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "setObject:forKeyedSubscript:", v93, CFSTR("ErrorObject"));

                }
              }
              else
              {
                objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v86, "personaID");
                v87 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v87)
                {
                  v37 = (void *)objc_opt_new();
                  objc_msgSend(v37, "setBundleIdentifier:", *(_QWORD *)(a1 + 56));
                  objc_msgSend(v37, "setStoreItemIdentifier:", *(_QWORD *)(a1 + 64));
                  objc_msgSend(v37, "setManifestURL:", *(_QWORD *)(a1 + 72));
                  objc_msgSend(v37, "setOriginator:", v111);
                  objc_msgSend(v37, "setPersonaIdentifier:", *(_QWORD *)(a1 + 80));
                  objc_msgSend(v37, "setManagementOptions:", v94);
                  objc_msgSend(v37, "setVPNUUIDString:", v14);
                  objc_msgSend(v37, "setCellularSliceUUIDString:", v15);
                  objc_msgSend(v37, "setContentFilterUUIDString:", v109);
                  v21 = v119;
                  objc_msgSend(v37, "setDNSProxyUUIDString:", v119);
                  objc_msgSend(v37, "setRelayUUIDString:", v114);
                  v23 = v100;
                  objc_msgSend(v37, "setAssociatedDomains:", v100);
                  objc_msgSend(v37, "setAssociatedDomainsEnableDirectDownloads:", v101);
                  objc_msgSend(v37, "setTapToPayScreenLock:", v103);
                  objc_msgSend(v37, "setAllowUserToHide:", v96);
                  objc_msgSend(v37, "setAllowUserToLock:", v31);
                  objc_msgSend(v37, "setRemovable:", v97);
                  objc_msgSend(v37, "setConfiguration:", *(_QWORD *)(a1 + 88));
                  v91 = *(void **)(a1 + 96);
                  v121[0] = MEMORY[0x24BDAC760];
                  v121[1] = 3221225472;
                  v121[2] = __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_7;
                  v121[3] = &unk_24EB68C58;
                  v122 = v8;
                  v123 = *(id *)(a1 + 112);
                  v92 = v91;
                  v22 = v114;
                  objc_msgSend(v92, "performRequest:completion:", v37, v121);

                  v85 = v122;
                  goto LABEL_72;
                }
                +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Error"));
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "setObject:forKeyedSubscript:", CFSTR("ManagementChangeNotSupported"), CFSTR("RejectionReason"));
              }
              (*(void (**)(void))(*(_QWORD *)(a1 + 112) + 16))();
              v22 = v114;
              v21 = v119;
              v23 = v100;
              goto LABEL_58;
            }
            v117 = v22;
            v69 = *(_QWORD *)(a1 + 112);
            objc_msgSend(*(id *)(a1 + 32), "_malformedRequestError");
            v105 = objc_claimAutoreleasedReturnValue();
            +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v105);
            v70 = objc_claimAutoreleasedReturnValue();
            v71 = *(void (**)(uint64_t))(v69 + 16);
            v72 = v69;
            v22 = v117;
            v98 = (void *)v70;
            v71(v72);
            v63 = (void *)v30;
            v31 = (void *)v105;

          }
LABEL_62:

          v29 = v101;
          goto LABEL_63;
        }
        v53 = v23;
        v54 = *(_QWORD *)(a1 + 112);
        objc_msgSend(*(id *)(a1 + 32), "_malformedRequestError");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = *(void (**)(uint64_t, void *))(v54 + 16);
        v58 = v54;
        v23 = v53;
        v57(v58, v56);

        v20 = v108;
      }
    }
LABEL_64:

    goto LABEL_65;
  }
  v6 = *(_QWORD *)(a1 + 112);
  +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

LABEL_69:
}

void __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("Identifier"));

  v5 = objc_msgSend(v3, "state");
  +[MDMParser _stringForAppState:](MDMParser, "_stringForAppState:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("State"));

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v4 = a3;
  v20 = v4;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v5, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE2C728]);

    if (v7)
    {
      v8 = *(void **)(a1 + 32);
      if (v8)
      {
        v9 = v8;
      }
      else
      {
        objc_msgSend(v5, "userInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE2C4B8]);
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
      v12 = objc_msgSend(v5, "code");
      v10 = CFSTR("NotSupported");
      switch(v12)
      {
        case 2600:
          v13 = *(void **)(a1 + 48);
          if (*(_QWORD *)(a1 + 40))
            objc_msgSend(v13, "_appAlreadyInstalledErrorWithiTunesStoreID:");
          else
            objc_msgSend(v13, "_appAlreadyInstalledErrorWithBundleID:", v9);
          v14 = objc_claimAutoreleasedReturnValue();
          goto LABEL_24;
        case 2601:
        case 2602:
          goto LABEL_30;
        case 2603:
          v16 = *(void **)(a1 + 48);
          if (*(_QWORD *)(a1 + 40))
            objc_msgSend(v16, "_appAlreadyQueuedErrorWithiTunesStoreID:");
          else
            objc_msgSend(v16, "_appAlreadyQueuedErrorWithBundleID:", v9);
          v19 = objc_claimAutoreleasedReturnValue();
          v10 = CFSTR("AppAlreadyQueued");
          goto LABEL_29;
        case 2604:
          objc_msgSend(*(id *)(a1 + 48), "_invalidManifestErrorWithURL:underlyingError:", *(_QWORD *)(a1 + 56), v5);
          v14 = objc_claimAutoreleasedReturnValue();
LABEL_24:
          v19 = v14;
          v10 = CFSTR("AppAlreadyInstalled");
          goto LABEL_29;
        case 2605:
          v18 = *(_QWORD *)(a1 + 40);
          v17 = *(void **)(a1 + 48);
          if (v18)
            objc_msgSend(v17, "_licenseNotFoundErrorWithiTunesStoreID:underlyingError:", v18, v5);
          else
            objc_msgSend(v17, "_licenseNotFoundErrorWithBundleID:underlyingError:", v9, v5);
          v19 = objc_claimAutoreleasedReturnValue();
          v10 = CFSTR("LicenseNotFound");
          goto LABEL_29;
        case 2606:
          objc_msgSend(*(id *)(a1 + 48), "_cannotValidateAppIDErrorUnderlyingError:", v5);
          v19 = objc_claimAutoreleasedReturnValue();
          v10 = CFSTR("CouldNotVerifyAppID");
LABEL_29:

          v5 = (id)v19;
          goto LABEL_30;
        default:
          if (v12 == 1001)
          {
            +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, CFSTR("Identifier"));
            objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("NeedsRedemption"), CFSTR("State"));
            goto LABEL_22;
          }
          if (v12 == 2616)
          {
            +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("NotNow"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
            (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

            goto LABEL_32;
          }
LABEL_30:

          break;
      }
    }
    else
    {
      v10 = CFSTR("NotSupported");
    }
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("RejectionReason"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_32:

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  if (a3)
  {
    v3 = *(_QWORD *)(a1 + 40);
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __184__MDMParser__performInstallApplicationRequestWithManifestURL_iTunesStoreIDObj_bundleId_flagsObj_attributes_configuration_manageChangeStr_purchaseMethodValue_personaID_completionBlock___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  if (a3)
  {
    v3 = *(_QWORD *)(a1 + 40);
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (id)_validateApplications:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v16;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Identifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MDMParser _identifiersIsStringArray:](self, "_identifiersIsStringArray:", v4))
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setBundleIdentifiers:", v4);
    objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v7 = (id)objc_msgSend(v6, "performRequest:error:", v5, &v16);
    v8 = v16;

    if (v8)
    {
      objc_msgSend(v8, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDD1398]);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
        v12 = (void *)v10;
      else
        v12 = v8;
      v13 = v12;

      +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)_applyRedemptionCode:(id)a3 assertion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RedemptionCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && v7
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "personaID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setBundleIdentifier:", v6);
    objc_msgSend(v10, "setRedemptionCode:", v7);
    -[MDMParser _originator](self, "_originator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOriginator:", v11);

    objc_msgSend(v10, "setPersonaIdentifier:", v9);
    objc_msgSend(MEMORY[0x24BE2C7E0], "currentUserConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v13 = (id)objc_msgSend(v12, "performRequest:error:", v10, &v25);
    v14 = v25;

    if (v14)
    {
      objc_msgSend(v14, "domain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)*MEMORY[0x24BE2C728];

      if (v15 == v16)
      {
        v17 = objc_msgSend(v14, "code");
        if (v17 == 1006)
        {
          v23 = 0;
          DMCErrorArray();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 12037;
        }
        else if (v17 == 2611)
        {
          v23 = v6;
          v24 = 0;
          DMCErrorArray();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 12028;
        }
        else
        {
          v19 = 0;
          v18 = 0;
        }
        objc_msgSend(MEMORY[0x24BDD1540], "DMCErrorWithDomain:code:descriptionArray:errorType:", *MEMORY[0x24BE2A728], v19, v18, *MEMORY[0x24BE2A588], v23, v24);
        v22 = objc_claimAutoreleasedReturnValue();

        v14 = (id)v22;
      }
      +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (id)_handleFetchAppsRequest:(id)a3 managedOnly:(BOOL)a4 deleteFeedback:(BOOL)a5 advanceTransientStates:(BOOL)a6 propertyKeys:(id)a7 block:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL8 v11;
  id v14;
  void (**v15)(_QWORD, void *);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  id v46;
  _BOOL4 v47;
  void (**v48)(_QWORD, void *);
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  _BYTE v55[128];
  _QWORD v56[3];

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v56[1] = *MEMORY[0x24BDAC8D0];
  v14 = a7;
  v15 = (void (**)(_QWORD, void *))a8;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Identifiers"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MDMParser _identifiersIsStringArray:](self, "_identifiersIsStringArray:", v16))
  {
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "setType:", 2);
    objc_msgSend(v17, "setBundleIdentifiers:", v16);
    objc_msgSend(v17, "setManagedAppsOnly:", v11);
    v56[0] = CFSTR("sourceIdentifier");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPropertyKeys:", v19);

    objc_msgSend(MEMORY[0x24BE2C7E0], "currentUserConnection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    objc_msgSend(v20, "performRequest:error:", v17, &v54);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v54;

    if (v22)
    {
      +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

      goto LABEL_27;
    }
    v47 = v10;
    v44 = v9;
    v42 = v17;
    v43 = v16;
    v48 = v15;
    v45 = v21;
    v46 = v14;
    objc_msgSend(v21, "appsByBundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "mutableCopy");

    objc_msgSend(v25, "allKeys");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v28 = v26;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v51 != v31)
            objc_enumerationMutation(v28);
          v33 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_msgSend(v25, "objectForKeyedSubscript:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "sourceIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            if (v11)
              objc_msgSend(v25, "setObject:forKeyedSubscript:", 0, v33);
          }
          else
          {
            objc_msgSend(v27, "addObject:", v33);
          }

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v30);
    }

    if (v47 || v44)
    {
      v17 = v42;
      if (objc_msgSend(v27, "count"))
      {
        v36 = (void *)objc_opt_new();

        objc_msgSend(v36, "setType:", 2);
        objc_msgSend(v36, "setBundleIdentifiers:", v27);
        objc_msgSend(v36, "setManagedAppsOnly:", v11);
        objc_msgSend(v36, "setDeleteFeedback:", v47);
        objc_msgSend(v36, "setAdvanceTransientStates:", v44);
        objc_msgSend(MEMORY[0x24BE2C7E0], "currentUserConnection");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 0;
        v38 = (id)objc_msgSend(v37, "performRequest:error:", v36, &v49);
        v22 = v49;

        if (v22)
        {
          +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v36;
          v16 = v43;
LABEL_25:

          v21 = v45;
          v14 = v46;
          v15 = v48;
          goto LABEL_26;
        }
        v17 = v36;
      }
      v16 = v43;
    }
    else
    {
      v17 = v42;
      v16 = v43;
    }
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v25, "copy");
    v48[2](v48, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "addEntriesFromDictionary:", v40);
    v22 = 0;
    goto LABEL_25;
  }
  +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

  return v23;
}

- (id)_managedApplicationList:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = CFSTR("managementInformation");
  v10 = CFSTR("configuration");
  v11 = CFSTR("feedback");
  v12 = CFSTR("isValidated");
  v13 = CFSTR("externalVersionIdentifier");
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMParser _handleFetchAppsRequest:managedOnly:deleteFeedback:advanceTransientStates:propertyKeys:block:](self, "_handleFetchAppsRequest:managedOnly:deleteFeedback:advanceTransientStates:propertyKeys:block:", v5, 1, 0, 1, v6, &__block_literal_global_910, v9, v10, v11, v12, v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __37__MDMParser__managedApplicationList___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  const __CFString *v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v26 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v3 = v2;
  v27 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v27)
  {
    v25 = *(_QWORD *)v29;
    v4 = MEMORY[0x24BDBD1C0];
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(v3);
        v6 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "managementInformation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_opt_new();
        +[MDMParser _stringForAppState:](MDMParser, "_stringForAppState:", objc_msgSend(v8, "state"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("Status"));

        objc_msgSend(v7, "configuration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = MEMORY[0x24BDBD1C8];
        if (v11)
          v13 = MEMORY[0x24BDBD1C8];
        else
          v13 = v4;
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("HasConfiguration"));

        objc_msgSend(v7, "feedback");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          v15 = v12;
        else
          v15 = v4;
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("HasFeedback"));

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "isValidated"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("IsValidated"));

        v17 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v7, "externalVersionIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "unsignedIntegerValue"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("ExternalVersionIdentifier"));

        objc_msgSend(v8, "unusedRedemptionCode");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, CFSTR("UnusedRedemptionCode"));

        v21 = objc_msgSend(v8, "options");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v21 & 0xF);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, CFSTR("ManagementFlags"));

        objc_msgSend(v26, "setObject:forKeyedSubscript:", v9, v6);
      }
      v27 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v27);
  }

  v32 = CFSTR("ManagedApplicationList");
  v33 = v26;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)_managedApplicationConfiguration:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = CFSTR("configuration");
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMParser _handleFetchAppsRequest:managedOnly:deleteFeedback:advanceTransientStates:propertyKeys:block:](self, "_handleFetchAppsRequest:managedOnly:deleteFeedback:advanceTransientStates:propertyKeys:block:", v5, 1, 0, 0, v6, &__block_literal_global_911, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __46__MDMParser__managedApplicationConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  const __CFString *v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x22767CA14](v5);
        v11 = (void *)objc_opt_new();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("Identifier"), (_QWORD)v16);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "configuration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("Configuration"));

        objc_msgSend(v3, "addObject:", v11);
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      v6 = v5;
    }
    while (v5);
  }

  v20 = CFSTR("ApplicationConfigurations");
  v21 = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_managedApplicationAttributes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v9 = CFSTR("VPNUUIDString");
  v10 = CFSTR("cellularSliceUUIDString");
  v11 = CFSTR("contentFilterUUIDString");
  v12 = CFSTR("DNSProxyUUIDString");
  v13 = CFSTR("relayUUIDString");
  v14 = CFSTR("associatedDomains");
  v15 = CFSTR("associatedDomainsEnableDirectDownloads");
  v16 = CFSTR("removable");
  v17 = CFSTR("allowUserToHide");
  v18 = CFSTR("allowUserToLock");
  v19 = CFSTR("tapToPayScreenLock");
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMParser _handleFetchAppsRequest:managedOnly:deleteFeedback:advanceTransientStates:propertyKeys:block:](self, "_handleFetchAppsRequest:managedOnly:deleteFeedback:advanceTransientStates:propertyKeys:block:", v5, 1, 0, 0, v6, &__block_literal_global_936, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,
    v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __43__MDMParser__managedApplicationAttributes___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  const __CFString *v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v37 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v4)
  {
    v5 = v4;
    v36 = *(_QWORD *)v39;
    v35 = *MEMORY[0x24BE60FD0];
    v34 = *MEMORY[0x24BE60FA0];
    v33 = *MEMORY[0x24BE60FA8];
    v32 = *MEMORY[0x24BE60FB0];
    v31 = *MEMORY[0x24BE60FB8];
    v30 = *MEMORY[0x24BE60F90];
    v29 = *MEMORY[0x24BE60F98];
    v28 = *MEMORY[0x24BE60FC8];
    v27 = *MEMORY[0x24BE60F80];
    v6 = *MEMORY[0x24BE60F88];
    v7 = *MEMORY[0x24BE60FC0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v39 != v36)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x22767CA14]();
        v11 = (void *)objc_opt_new();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("Identifier"));
        v12 = (void *)objc_opt_new();
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "VPNUUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, v35);

        objc_msgSend(v13, "cellularSliceUUIDString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, v34);

        objc_msgSend(v13, "contentFilterUUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, v33);

        objc_msgSend(v13, "DNSProxyUUIDString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, v32);

        objc_msgSend(v13, "relayUUIDString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, v31);

        objc_msgSend(v13, "associatedDomains");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, v30);

        objc_msgSend(v13, "associatedDomainsEnableDirectDownloads");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, v29);

        objc_msgSend(v13, "tapToPayScreenLock");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, v28);

        objc_msgSend(v13, "allowUserToHide");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, v27);

        objc_msgSend(v13, "allowUserToLock");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, v6);

        objc_msgSend(v13, "removable");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, v7);

        objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("Attributes"));
        objc_msgSend(v37, "addObject:", v11);

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v5);
  }

  v42 = CFSTR("ApplicationAttributes");
  v43 = v37;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)_managedApplicationFeedback:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeleteFeedback"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_msgSend(v5, "BOOLValue");
    v10[0] = CFSTR("feedback");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MDMParser _handleFetchAppsRequest:managedOnly:deleteFeedback:advanceTransientStates:propertyKeys:block:](self, "_handleFetchAppsRequest:managedOnly:deleteFeedback:advanceTransientStates:propertyKeys:block:", v4, 1, v6, 0, v7, &__block_literal_global_939);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

id __41__MDMParser__managedApplicationFeedback___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  const __CFString *v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x22767CA14](v5);
        v11 = (void *)objc_opt_new();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("Identifier"), (_QWORD)v16);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "feedback");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("Feedback"));

        objc_msgSend(v3, "addObject:", v11);
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      v6 = v5;
    }
    while (v5);
  }

  v20 = CFSTR("ManagedApplicationFeedback");
  v21 = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_removeApplication:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  _QWORD v34[2];
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)objc_opt_new();
      objc_msgSend(v5, "setType:", 2);
      objc_msgSend(v5, "setManagedAppsOnly:", 1);
      v35[0] = v4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBundleIdentifiers:", v6);

      v34[0] = CFSTR("managementInformation");
      v34[1] = CFSTR("sourceIdentifier");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPropertyKeys:", v7);

      objc_msgSend(MEMORY[0x24BE2C7E0], "currentUserConnection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      objc_msgSend(v8, "performRequest:error:", v5, &v31);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v31;
      if (v10)
      {
        v11 = v10;
        v12 = (void *)MEMORY[0x24BDD1540];
        v13 = *MEMORY[0x24BE2A728];
        DMCErrorArray();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:errorType:", v13, 12087, v14, *MEMORY[0x24BE2A588], v4, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(v9, "appsByBundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "allValues");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "managementInformation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[MDMParser _isManagedAppFromManagementInformation:](self, "_isManagedAppFromManagementInformation:", v15))
      {
        objc_msgSend(v14, "sourceIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          v21 = (void *)objc_opt_new();
          objc_msgSend(v21, "setBundleIdentifier:", v4);
          objc_msgSend(MEMORY[0x24BE2C7E0], "currentUserConnection");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0;
          v24 = (id)objc_msgSend(v23, "performRequest:error:", v21, &v30);
          v11 = v30;

          if (v11)
          {
            v25 = (void *)MEMORY[0x24BDD1540];
            v26 = *MEMORY[0x24BE2A728];
            DMCErrorArray();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "DMCErrorWithDomain:code:descriptionArray:errorType:", v26, 12087, v29, *MEMORY[0x24BE2A588], v4, 0);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v27);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v28 = *(NSObject **)(DMCLogObjects() + 8);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v33 = v4;
              _os_log_impl(&dword_222CB9000, v28, OS_LOG_TYPE_DEFAULT, "Removed app “%{public}@”.", buf, 0xCu);
            }
            +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_11;
        }
        -[MDMParser _installApplicationCouldNotModifyDDMAppsError](self, "_installApplicationCouldNotModifyDDMAppsError");
        v20 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[MDMParser _notManagedErrorAppID:](self, "_notManagedErrorAppID:", v4);
        v20 = objc_claimAutoreleasedReturnValue();
      }
      v21 = (void *)v20;
      +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
LABEL_11:

      goto LABEL_12;
    }
  }
  +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v16;
}

- (BOOL)_isTriggerDiagnosticsAllowed
{
  return 0;
}

- (id)_triggerDiagnostics:(id)a3
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2A868]), "initWithReason:", CFSTR("MDM-TriggerDiagnostics"));
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_DEFAULT, "Triggering diagnostics...", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __33__MDMParser__triggerDiagnostics___block_invoke;
  v10[3] = &unk_24EB68D70;
  v11 = v3;
  v7 = v3;
  objc_msgSend(v5, "performRequest:completion:", v6, v10);

  +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __33__MDMParser__triggerDiagnostics___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *(NSObject **)(DMCLogObjects() + 8);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = v4;
      objc_msgSend(v3, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_DEFAULT, "Error triggerring diagnostics:\n%{public}@", (uint8_t *)&v8, 0xCu);

    }
  }
  else if (v5)
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_DEFAULT, "Diagnostics collected successfully.", (uint8_t *)&v8, 2u);
  }

}

- (void)_requestMirroringRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  unint64_t v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  id v26;

  v7 = a3;
  v8 = (void (**)(id, void *))a5;
  objc_msgSend(v7, "objectForKey:", CFSTR("DestinationName"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("DestinationDeviceID"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (v9 | v10)
  {
    v11 = (void *)v10;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("Password"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v7, "objectForKey:", CFSTR("ScanTime"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v15 = 30.0;
          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v13, "doubleValue");
          v15 = v14;
LABEL_16:
          v24 = v13;
          if (v11)
          {
            objc_msgSend(v11, "uppercaseString", v13);
            v17 = objc_claimAutoreleasedReturnValue();

            v11 = (void *)v17;
          }
          v18 = (void *)objc_opt_new();
          objc_msgSend(v18, "setDestinationName:", v9);
          objc_msgSend(v18, "setDestinationDeviceID:", v11);
          objc_msgSend(v18, "setPassword:", v12);
          objc_msgSend(v18, "setScanWaitInterval:", v15);
          objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0;
          objc_msgSend(v19, "performRequest:error:", v18, &v26);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v26;

          if (v21)
          {
            +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v21);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v20, "status") - 1;
            if (v22 > 2)
              v23 = CFSTR("Unknown");
            else
              v23 = off_24EB68FD0[v22];
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, CFSTR("MirroringResult"), v24);
          }
          -[MDMParser _sendAnalyticsMDMCommandEventWithRequest:response:](self, "_sendAnalyticsMDMCommandEventWithRequest:response:", v7, v16, v24);
          if (v8)
            v8[2](v8, v16);

          goto LABEL_31;
        }
        +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
  }
  -[MDMParser _sendAnalyticsMDMCommandEventWithRequest:response:](self, "_sendAnalyticsMDMCommandEventWithRequest:response:", v7, v16);
  if (v8)
    v8[2](v8, v16);
LABEL_31:

}

- (void)_stopMirroringRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__MDMParser__stopMirroringRequest_assertion_completionBlock___block_invoke;
  v13[3] = &unk_24EB68D98;
  v13[4] = self;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  objc_msgSend(v9, "performRequest:completion:", v10, v13);

}

void __61__MDMParser__stopMirroringRequest_assertion_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)_inviteToProgramRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  void (**v23)(_QWORD, _QWORD);
  _QWORD v24[5];
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __63__MDMParser__inviteToProgramRequest_assertion_completionBlock___block_invoke;
  v24[3] = &unk_24EB689E0;
  v24[4] = self;
  v12 = v8;
  v25 = v12;
  v13 = v10;
  v26 = v13;
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x22767CBAC](v24);
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("InvitationURL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v14)[2](v14, v17);
        goto LABEL_13;
      }
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ProgramID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if ((objc_msgSend(&unk_24EB77A80, "containsObject:", v17) & 1) != 0)
        {
          v18 = (void *)objc_opt_new();
          -[MDMParser _originator](self, "_originator");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setOriginator:", v19);

          objc_msgSend(v18, "setURL:", v16);
          objc_msgSend(MEMORY[0x24BE2C7E0], "currentUserConnection");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = v11;
          v21[1] = 3221225472;
          v21[2] = __63__MDMParser__inviteToProgramRequest_assertion_completionBlock___block_invoke_2;
          v21[3] = &unk_24EB68DC0;
          v23 = v14;
          v22 = v9;
          objc_msgSend(v20, "performRequest:completion:", v18, v21);

LABEL_11:
LABEL_13:

          goto LABEL_14;
        }
        +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("InvalidProgramID"), CFSTR("InvitationResult"));
      }
      else
      {
        +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      ((void (**)(_QWORD, void *))v14)[2](v14, v18);
      goto LABEL_11;
    }
  }
  +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v14)[2](v14, v16);
LABEL_14:

}

void __63__MDMParser__inviteToProgramRequest_assertion_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __63__MDMParser__inviteToProgramRequest_assertion_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (!v5)
  {
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    v10 = CFSTR("Acknowledged");
LABEL_9:
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("InvitationResult"));
    goto LABEL_10;
  }
  +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE2C728]);

  if (v8)
  {
    v9 = objc_msgSend(v5, "code");
    if (v9 == 1402)
    {
      v10 = CFSTR("InvalidInvitationURL");
      goto LABEL_8;
    }
    if (v9 == 1400)
    {
      v10 = CFSTR("AppStoreNotAllowed");
LABEL_8:
      v11 = v6;
      goto LABEL_9;
    }
  }
LABEL_10:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_activationLockBypassCodeRequest:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__MDMParser__activationLockBypassCodeRequest_completionBlock___block_invoke;
  v12[3] = &unk_24EB68DE8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "performRequest:completion:", v8, v12);

}

void __62__MDMParser__activationLockBypassCodeRequest_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v21 = CFSTR("Status");
    v22[0] = CFSTR("Acknowledged");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v5, "bypassCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v7, CFSTR("ActivationLockBypassCode"));
    goto LABEL_9;
  }
  v7 = v6;
  if (objc_msgSend(v6, "code") == 3600)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x24BE2A588];
    v12 = v8;
    v13 = v9;
    v14 = 12085;
LABEL_7:
    objc_msgSend(v12, "DMCErrorWithDomain:code:descriptionArray:errorType:", v13, v14, v10, v11, 0);
    v19 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v19;
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "code") == 3601)
  {
    v17 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BE2A728];
    DMCErrorArray();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x24BE2A598];
    v12 = v17;
    v13 = v18;
    v14 = 12086;
    goto LABEL_7;
  }
LABEL_8:
  +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(_QWORD *)(a1 + 40), v16);
  v20 = *(_QWORD *)(a1 + 48);
  if (v20)
    (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v16);

}

- (void)_clearActivationLockBypassCodeRequest:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__MDMParser__clearActivationLockBypassCodeRequest_completionBlock___block_invoke;
  v12[3] = &unk_24EB68D98;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "performRequest:completion:", v9, v12);

}

void __67__MDMParser__clearActivationLockBypassCodeRequest_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v5);
  else
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(_QWORD *)(a1 + 40), v6);
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);

}

- (void)_installMedia:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  void (**v45)(_QWORD, _QWORD);
  _QWORD v46[5];
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __53__MDMParser__installMedia_assertion_completionBlock___block_invoke;
  v46[3] = &unk_24EB689E0;
  v46[4] = self;
  v12 = v8;
  v47 = v12;
  v13 = v10;
  v48 = v13;
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x22767CBAC](v46);
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MediaType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("Book")) & 1) != 0)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PersistentID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MediaURL"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v17);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Kind"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("iTunesStoreID"));
      v18 = objc_claimAutoreleasedReturnValue();
      if (_installMedia_assertion_completionBlock__onceToken != -1)
        dispatch_once(&_installMedia_assertion_completionBlock__onceToken, &__block_literal_global_990);
      v37 = (void *)v18;
      if (v16)
      {
        if (!v40 || !objc_msgSend(v17, "length"))
        {
          v23 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v50 = v17;
            v24 = "Invalid URL: %{public}@";
            goto LABEL_20;
          }
LABEL_25:
          +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v14)[2](v14, v26);
LABEL_28:

          goto LABEL_16;
        }
        v34 = v17;
        v19 = (uint64_t)v38;
        if (!v38)
        {
          objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v40, 0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "path");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "pathExtension");
          v19 = objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend((id)_installMedia_assertion_completionBlock__typeMap, "allKeys", v34);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)v19;
        v22 = objc_msgSend(v21, "containsObject:", v19);

        if ((v22 & 1) == 0)
        {
          v23 = *(NSObject **)(DMCLogObjects() + 8);
          v17 = v35;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v50 = v38;
            v24 = "Invalid book kind: %{public}@";
LABEL_20:
            _os_log_impl(&dword_222CB9000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0xCu);
            goto LABEL_25;
          }
          goto LABEL_25;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_25;
        v35 = v17;
      }
      v26 = (void *)objc_opt_new();
      objc_msgSend(v26, "setPersistentID:", v16);
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Author"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAuthor:", v27);

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Title"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTitle:", v28);

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Version"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setVersion:", v29);

      objc_msgSend(v26, "setURL:", v40);
      objc_msgSend((id)_installMedia_assertion_completionBlock__typeMap, "objectForKeyedSubscript:", v38);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setType:", objc_msgSend(v30, "unsignedIntegerValue"));

      if (v37)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v37, "longLongValue"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setITunesStoreID:", v31);

      }
      else
      {
        objc_msgSend(v26, "setITunesStoreID:", 0);
      }
      -[MDMParser _originator](self, "_originator", v35);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setOriginator:", v32);

      objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v11;
      v41[1] = 3221225472;
      v41[2] = __53__MDMParser__installMedia_assertion_completionBlock___block_invoke_996;
      v41[3] = &unk_24EB68E30;
      v41[4] = self;
      v42 = v40;
      v43 = v16;
      v45 = v14;
      v44 = v9;
      objc_msgSend(v33, "performRequest:completion:", v26, v41);

      v17 = v36;
      goto LABEL_28;
    }
    +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v25, "mutableCopy");

    objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("WrongMediaType"), CFSTR("RejectionReason"));
  }
  else
  {
    +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  ((void (**)(_QWORD, void *))v14)[2](v14, v16);
LABEL_16:

}

void __53__MDMParser__installMedia_assertion_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(_QWORD *)(a1 + 40), v3);
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __53__MDMParser__installMedia_assertion_completionBlock___block_invoke_2;
    v6[3] = &unk_24EB67F18;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __53__MDMParser__installMedia_assertion_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __53__MDMParser__installMedia_assertion_completionBlock___block_invoke_3()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("ibooks");
  v2[1] = CFSTR("pdf");
  v3[0] = &unk_24EB77B40;
  v3[1] = &unk_24EB77B58;
  v2[2] = CFSTR("epub");
  v3[2] = &unk_24EB77B70;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_installMedia_assertion_completionBlock__typeMap;
  _installMedia_assertion_completionBlock__typeMap = v0;

}

void __53__MDMParser__installMedia_assertion_completionBlock___block_invoke_996(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a2;
  v5 = a3;
  +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE2C728]) & 1) != 0)
    {
      v8 = objc_msgSend(v5, "code");

      if (v8 == 1650)
      {
        +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("NotNow"));
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_17:
        v19 = (void *)v9;

        v6 = v19;
        goto LABEL_18;
      }
    }
    else
    {

    }
    v13 = objc_msgSend(v5, "code");
    switch(v13)
    {
      case 2608:
        v14 = 12040;
        goto LABEL_15;
      case 2609:
      case 2610:
      case 2611:
        goto LABEL_16;
      case 2612:
        v14 = 12045;
        goto LABEL_15;
      case 2613:
        v14 = 12043;
        goto LABEL_15;
      case 2614:
        v14 = 12046;
        goto LABEL_15;
      case 2615:
        v14 = 12047;
        goto LABEL_15;
      default:
        if (v13 != 1504)
          goto LABEL_16;
        v14 = 12008;
LABEL_15:
        v15 = (void *)MEMORY[0x24BDD1540];
        v16 = *MEMORY[0x24BE2A728];
        DMCUnformattedErrorArray();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v16, v14, v17, v5, *MEMORY[0x24BE2A588], 0);
        v18 = objc_claimAutoreleasedReturnValue();

        v5 = (id)v18;
LABEL_16:
        +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v5);
        v9 = objc_claimAutoreleasedReturnValue();
        break;
    }
    goto LABEL_17;
  }
  objc_msgSend(v20, "book");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iTunesStoreID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("iTunesStoreID"));

  objc_msgSend(*(id *)(a1 + 32), "_stringForBookState:", objc_msgSend(v5, "state"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("State"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Book"), CFSTR("MediaType"));
  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("MediaURL"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("PersistentID"));
LABEL_18:

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)_managedMediaList:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__MDMParser__managedMediaList_assertion_completionBlock___block_invoke;
  v13[3] = &unk_24EB68E58;
  v13[4] = self;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  objc_msgSend(v9, "performRequest:completion:", v10, v13);

}

void __57__MDMParser__managedMediaList_assertion_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[2];
  _QWORD v37[2];
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      objc_msgSend(v4, "DMCVerboseDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v7;
      _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_ERROR, "Failed to retrieve managed books with error: %{public}@", buf, 0xCu);

    }
    objc_msgSend(v4, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE2C728]))
    {
      v9 = objc_msgSend(v4, "code");

      if (v9 == 1650)
      {
        +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("NotNow"));
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
    }
    else
    {

    }
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_21:
    v13 = (id)v10;
    objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(_QWORD *)(a1 + 40), v10);
    v30 = *(_QWORD *)(a1 + 48);
    if (v30)
      (*(void (**)(uint64_t, id))(v30 + 16))(v30, v13);
    goto LABEL_23;
  }
  objc_msgSend(a2, "books");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
    do
    {
      v17 = v13;
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v17);
        v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v20 = (void *)objc_opt_new();
        objc_msgSend(v19, "iTunesStoreID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("iTunesStoreID"));

        objc_msgSend(v19, "persistentID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("PersistentID"));

        objc_msgSend(v19, "version");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("Version"));

        objc_msgSend(v19, "title");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, CFSTR("Title"));

        objc_msgSend(v19, "author");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v25, CFSTR("Author"));

        v26 = objc_msgSend(v19, "type");
        if (v26 <= 2)
          objc_msgSend(v20, "setObject:forKeyedSubscript:", off_24EB68FE8[v26], CFSTR("Kind"));
        objc_msgSend(*(id *)(a1 + 32), "_stringForBookState:", objc_msgSend(v19, "state"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v27, CFSTR("State"));

        objc_msgSend(v12, "addObject:", v20);
      }
      v13 = v17;
      v15 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v15);
  }

  v36[0] = CFSTR("Status");
  v36[1] = CFSTR("Books");
  v37[0] = CFSTR("Acknowledged");
  v37[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(_QWORD *)(a1 + 40), v28);
  v29 = *(_QWORD *)(a1 + 48);
  if (v29)
    (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v28);

  v4 = 0;
LABEL_23:

}

- (void)_removeMedia:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(_QWORD, _QWORD);
  _QWORD v21[5];
  id v22;
  id v23;

  v7 = a3;
  v8 = a5;
  v9 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __52__MDMParser__removeMedia_assertion_completionBlock___block_invoke;
  v21[3] = &unk_24EB689E0;
  v21[4] = self;
  v10 = v7;
  v22 = v10;
  v11 = v8;
  v23 = v11;
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x22767CBAC](v21);
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MediaType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PersistentID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("iTunesStoreID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v13, "isEqualToString:", CFSTR("Book")) & 1) != 0)
    {
      v16 = (void *)objc_opt_new();
      if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v16, "setPersistentID:", v14);
      }
      else
      {
        if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v12)[2](v12, v18);
          goto LABEL_14;
        }
        objc_msgSend(v16, "setITunesStoreID:", v15);
      }
      objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v9;
      v19[1] = 3221225472;
      v19[2] = __52__MDMParser__removeMedia_assertion_completionBlock___block_invoke_3;
      v19[3] = &unk_24EB68E80;
      v20 = v12;
      objc_msgSend(v17, "performRequest:completion:", v16, v19);

      v18 = v20;
LABEL_14:

      goto LABEL_8;
    }
  }
  +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v12)[2](v12, v16);
LABEL_8:

}

void __52__MDMParser__removeMedia_assertion_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(_QWORD *)(a1 + 40), v3);
    v4 = *(void **)(a1 + 48);
    if (v4)
    {
      dispatch_get_global_queue(0, 0);
      v5 = objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __52__MDMParser__removeMedia_assertion_completionBlock___block_invoke_2;
      v6[3] = &unk_24EB67F18;
      v8 = v4;
      v7 = v3;
      dispatch_async(v5, v6);

    }
  }

}

uint64_t __52__MDMParser__removeMedia_assertion_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __52__MDMParser__removeMedia_assertion_completionBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (v4)
  {
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE2C728]))
    {
      v6 = objc_msgSend(v10, "code");

      if (v6 == 1650)
      {
        +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("NotNow"));
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v9 = (void *)v7;
        (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v7);
        goto LABEL_9;
      }
    }
    else
    {

    }
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v10);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v8 = *(_QWORD *)(a1 + 32);
  +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
LABEL_9:

}

- (void)_deviceConfigured:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t v18[8];
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__5;
  v28 = __Block_byref_object_dispose__5;
  v29 = 0;
  objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "details");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (v13)
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE2A488]);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __57__MDMParser__deviceConfigured_assertion_completionBlock___block_invoke;
    v19[3] = &unk_24EB68ED0;
    v23 = &v24;
    v19[4] = self;
    v20 = v8;
    v22 = v10;
    v21 = v9;
    +[MDMMCInterface storeCloudConfigurationDetails:completion:](MDMMCInterface, "storeCloudConfigurationDetails:completion:", v13, v19);

  }
  else
  {
    v14 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_222CB9000, v14, OS_LOG_TYPE_ERROR, "Device asked to end device configuration, but no cloud configuration yet in place.", v18, 2u);
    }
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("NotNow"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "mutableCopy");
    v17 = (void *)v25[5];
    v25[5] = v16;

    -[MDMParser _sendAnalyticsMDMCommandEventWithRequest:response:](self, "_sendAnalyticsMDMCommandEventWithRequest:response:", v8, v25[5]);
    if (v10)
      (*((void (**)(id, uint64_t))v10 + 2))(v10, v25[5]);
  }

  _Block_object_dispose(&v24, 8);
}

void __57__MDMParser__deviceConfigured_assertion_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[2] = __57__MDMParser__deviceConfigured_assertion_completionBlock___block_invoke_2;
  v7[3] = &unk_24EB68EA8;
  v13 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v7[1] = 3221225472;
  v10 = v5;
  v12 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __57__MDMParser__deviceConfigured_assertion_completionBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t result;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v10 = 138543362;
      v11 = v3;
      _os_log_impl(&dword_222CB9000, v2, OS_LOG_TYPE_ERROR, "Could not update await device configure - %{public}@", (uint8_t *)&v10, 0xCu);
    }
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  v6 = objc_msgSend(v4, "mutableCopy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(*(id *)(a1 + 40), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  return result;
}

- (id)_accessibilitySettings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  +[MDMAccessibilityManager sharedInstance](MDMAccessibilityManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v2, "zoomEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ZoomEnabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v2, "boldTextEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("BoldTextEnabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v2, "voiceOverEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("VoiceOverEnabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v2, "reduceMotionEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ReduceMotionEnabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v2, "increaseContrastEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("IncreaseContrastEnabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v2, "textSize"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("TextSize"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v2, "reduceTransparencyEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("ReduceTransparencyEnabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v2, "touchAccommodationsEnabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("TouchAccommodationsEnabled"));

  return v3;
}

- (void)_scheduleOSUpdateScan:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  void (**v7)(id, void *);
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v7 = (void (**)(id, void *))a5;
  v8 = a3;
  v9 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v9, OS_LOG_TYPE_DEFAULT, "Schedule OS update scan start.", buf, 2u);
  }
  +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMParser _sendAnalyticsMDMCommandEventWithRequest:response:](self, "_sendAnalyticsMDMCommandEventWithRequest:response:", v8, v10);

  if (v7)
    v7[2](v7, v10);
  v11 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_222CB9000, v11, OS_LOG_TYPE_DEFAULT, "Schedule OS update scan end.", v12, 2u);
  }

}

- (void)_scheduleOSUpdate:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v11, OS_LOG_TYPE_DEFAULT, "Schedule OS update start", buf, 2u);
  }
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __57__MDMParser__scheduleOSUpdate_assertion_completionBlock___block_invoke;
  v20[3] = &unk_24EB689E0;
  v20[4] = self;
  v12 = v8;
  v21 = v12;
  v13 = v10;
  v22 = v13;
  v14 = (void *)MEMORY[0x22767CBAC](v20);
  if (-[MDMParser _rejectSoftwareUpdateBecauseUserLoggedInCompletionBlock:](self, "_rejectSoftwareUpdateBecauseUserLoggedInCompletionBlock:", v14))
  {
    v15 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v16 = "Rejected software update due to user logged in.";
      v17 = v15;
      v18 = OS_LOG_TYPE_ERROR;
LABEL_8:
      _os_log_impl(&dword_222CB9000, v17, v18, v16, buf, 2u);
    }
  }
  else
  {
    -[MDMParser _dmfScheduleOSUpdate:assertion:completionBlock:](self, "_dmfScheduleOSUpdate:assertion:completionBlock:", v12, v9, v14);
    v19 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "Schedule OS update end.";
      v17 = v19;
      v18 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_8;
    }
  }

}

void __57__MDMParser__scheduleOSUpdate_assertion_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)_dmfScheduleOSUpdate:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  NSObject *v22;
  __CFString *v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  __CFString *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  BOOL v51;
  __CFString *v52;
  const __CFString *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  id v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  __CFString *v67;
  __CFString *v68;
  void *v69;
  __CFString *v70;
  id v71;
  uint64_t v72;
  void *v73;
  uint8_t buf[4];
  const __CFString *v75;
  const __CFString *v76;
  const __CFString *v77;
  _QWORD v78[3];

  v78[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, void *))a5;
  v9 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v9, OS_LOG_TYPE_DEFAULT, "DMF Schedule OS update start.", buf, 2u);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Updates"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[MDMParser _rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:](self, "_rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:", v8);
    v19 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v20 = "Rejected software update due to malformed update array.";
      goto LABEL_19;
    }
  }
  else
  {
    if (!objc_msgSend(v10, "count"))
    {
      v76 = CFSTR("InstallAction");
      v77 = CFSTR("Default");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v78[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 1);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }
    if (objc_msgSend(v10, "count") == 1)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[MDMParser _rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:](self, "_rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:", v8);
        v21 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_222CB9000, v21, OS_LOG_TYPE_ERROR, "Rejected software update due to missing or malformed OS update object.", buf, 2u);
        }
        goto LABEL_80;
      }
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ProductKey"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          -[MDMParser _rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:](self, "_rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:", v8);
          v22 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_222CB9000, v22, OS_LOG_TYPE_ERROR, "Rejected software update due to malformed product key.", buf, 2u);
          }
          goto LABEL_79;
        }
      }
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("InstallAction"));
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (__CFString *)v15;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          -[MDMParser _rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:](self, "_rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:", v8);
          v17 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v18 = "Rejected software update due to malformed install action.";
LABEL_32:
            _os_log_impl(&dword_222CB9000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
            goto LABEL_78;
          }
          goto LABEL_78;
        }
      }
      else
      {
        v16 = CFSTR("Default");
      }
      v72 = 0;
      if ((objc_msgSend((id)objc_opt_class(), "_dmfAction:fromMDMActionString:", &v72, v16) & 1) == 0)
      {
        -[MDMParser _rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:](self, "_rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:", v8);
        v17 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v18 = "Rejected software update due to malformed OS update action.";
          goto LABEL_32;
        }
LABEL_78:

LABEL_79:
LABEL_80:

        goto LABEL_81;
      }
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ProductVersion"));
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          -[MDMParser _rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:](self, "_rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:", v8);
          v30 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v31 = "Rejected software update due to malformed product version.";
            goto LABEL_52;
          }
LABEL_77:

          goto LABEL_78;
        }
        v24 = *(NSObject **)(DMCLogObjects() + 8);
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
LABEL_36:
          v29 = objc_msgSend((id)objc_opt_class(), "_shouldUseDelayWithRequest:", v7);
          if (v29 == 2)
          {
            -[MDMParser _rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:](self, "_rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:", v8);
            v30 = *(NSObject **)(DMCLogObjects() + 8);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v31 = "Rejected software update due to \"use delay\" bad request.";
LABEL_52:
              _os_log_impl(&dword_222CB9000, v30, OS_LOG_TYPE_ERROR, v31, buf, 2u);
              goto LABEL_77;
            }
            goto LABEL_77;
          }
          v32 = v29;
          v67 = v16;
          v70 = v23;
          v33 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v34 = CFSTR("NO");
            if (v32 == 1)
              v34 = CFSTR("YES");
            *(_DWORD *)buf = 138543362;
            v75 = v34;
            _os_log_impl(&dword_222CB9000, v33, OS_LOG_TYPE_DEFAULT, "scheduleOSUpdate useDelay = %{public}@", buf, 0xCu);
          }
          v35 = (void *)objc_opt_new();
          objc_msgSend(v35, "setProductKey:", v14);
          objc_msgSend(v35, "setProductVersion:", v70);
          objc_msgSend(v35, "setAction:", v72);
          objc_msgSend(v35, "setUseDelay:", v32 == 1);
          objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = 0;
          objc_msgSend(v36, "performRequest:error:", v35, &v71);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v71;

          v39 = v37;
          if (!v37)
          {
            v48 = v38;
            objc_msgSend((id)objc_opt_class(), "_errorFromDMFSoftwareUpdateError:", v38);
            v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v49 = *(NSObject **)(DMCLogObjects() + 8);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v75 = v45;
              _os_log_impl(&dword_222CB9000, v49, OS_LOG_TYPE_ERROR, "Could not schedule an update - %{public}@", buf, 0xCu);
            }
            +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v45);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (v8)
              v8[2](v8, v47);
            goto LABEL_75;
          }
          v63 = v38;
          v69 = v37;
          objc_msgSend(v37, "error");
          v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[__CFString domain](v40, "domain");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = *MEMORY[0x24BE2C728];
          v66 = v35;
          v68 = v40;
          if (objc_msgSend(v41, "isEqualToString:", *MEMORY[0x24BE2C728]))
          {
            v43 = -[__CFString code](v40, "code");

            if (v43 == 2213)
            {
              v44 = *(NSObject **)(DMCLogObjects() + 8);
              v45 = v68;
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_222CB9000, v44, OS_LOG_TYPE_DEFAULT, "No update available.", buf, 2u);
              }
              v39 = v69;
              if (!v8)
              {
                v48 = v63;
                goto LABEL_76;
              }
              +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = (void *)objc_msgSend(v46, "mutableCopy");

              objc_msgSend(v47, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1A8], CFSTR("UpdateResults"));
              v8[2](v8, v47);
              v48 = v63;
LABEL_75:

LABEL_76:
              v23 = v70;
              v16 = v67;
              goto LABEL_77;
            }
          }
          else
          {

          }
          -[__CFString domain](v68, "domain");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v50, "isEqualToString:", v42))
            v51 = -[__CFString code](v68, "code") == 2200 || -[__CFString code](v68, "code") == 2207;
          else
            v51 = 0;

          objc_msgSend((id)objc_opt_class(), "_resolvedInstallActionStringForAction:", objc_msgSend(v69, "action"));
          v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!v68 || v51)
          {
            v64 = 0;
            v53 = CFSTR("Error");
            if (v52)
              v53 = v52;
          }
          else
          {

            objc_msgSend((id)objc_opt_class(), "_errorFromDMFSoftwareUpdateError:", v68);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = CFSTR("Error");
          }
          v65 = v53;
          objc_msgSend((id)objc_opt_class(), "_statusFromError:action:", v68, objc_msgSend(v69, "action"));
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = (void *)objc_opt_new();
          objc_msgSend(v55, "setObject:forKeyedSubscript:", v65, CFSTR("InstallAction"));
          objc_msgSend(v69, "productKey");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setObject:forKeyedSubscript:", v56, CFSTR("ProductKey"));

          v62 = (void *)v54;
          objc_msgSend(v55, "setObject:forKeyedSubscript:", v54, CFSTR("Status"));
          if (v64)
          {
            objc_msgSend((id)objc_opt_class(), "errorChainFromError:", v64);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "setObject:forKeyedSubscript:", v57, CFSTR("ErrorChain"));

          }
          +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = (void *)objc_msgSend(v58, "mutableCopy");

          v73 = v55;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v73, 1);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setObject:forKeyedSubscript:", v60, CFSTR("UpdateResults"));

          if (v8)
            v8[2](v8, v59);
          v61 = *(NSObject **)(DMCLogObjects() + 8);
          v35 = v66;
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_222CB9000, v61, OS_LOG_TYPE_DEFAULT, "DMF Schedule OS update end.", buf, 2u);
          }

          v45 = v68;
          v39 = v69;
          v48 = v63;
          v47 = (void *)v65;
          goto LABEL_75;
        }
        *(_DWORD *)buf = 138543362;
        v75 = v23;
        v25 = "Requesting an update with a specific PMV - %{public}@";
        v26 = v24;
        v27 = 12;
      }
      else
      {
        v28 = *(NSObject **)(DMCLogObjects() + 8);
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          goto LABEL_36;
        *(_WORD *)buf = 0;
        v25 = "Requesting an update with any PMV";
        v26 = v28;
        v27 = 2;
      }
      _os_log_impl(&dword_222CB9000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      goto LABEL_36;
    }
    -[MDMParser _rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:](self, "_rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:", v8);
    v19 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v20 = "Rejected software update due to multiple OS update objects.";
LABEL_19:
      _os_log_impl(&dword_222CB9000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    }
  }
LABEL_81:

}

- (void)_mdmScheduleOSUpdate:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  char v22;
  char v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[16];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, void *))a5;
  v9 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v9, OS_LOG_TYPE_DEFAULT, "MDM Schedule OS update start.", buf, 2u);
  }
  if (-[MDMParser _rejectSoftwareUpdateBecauseUserLoggedInCompletionBlock:](self, "_rejectSoftwareUpdateBecauseUserLoggedInCompletionBlock:", v8))
  {
    v10 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v11 = "Rejected software update due to user logged in.";
      v12 = v10;
      v13 = OS_LOG_TYPE_ERROR;
LABEL_29:
      _os_log_impl(&dword_222CB9000, v12, v13, v11, buf, 2u);
      goto LABEL_38;
    }
    goto LABEL_38;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Updates"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v33;
        v31 = v7;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v33 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v27 = *(NSObject **)(DMCLogObjects() + 8);
              v7 = v31;
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_222CB9000, v27, OS_LOG_TYPE_ERROR, "Rejected software update due to malformed update object.", buf, 2u);
              }
              goto LABEL_35;
            }
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("ProductKey"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v28 = *(NSObject **)(DMCLogObjects() + 8);
                v7 = v31;
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_222CB9000, v28, OS_LOG_TYPE_ERROR, "Rejected software update due to malformed product key.", buf, 2u);
                }

                goto LABEL_35;
              }
            }

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          v7 = v31;
          if (v17)
            continue;
          break;
        }
      }
LABEL_35:

      goto LABEL_36;
    }
    v24 = *(NSObject **)(DMCLogObjects() + 8);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
LABEL_36:

      if (v8)
      {
        +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v29, "mutableCopy");

        v8[2](v8, v30);
      }
      goto LABEL_38;
    }
    *(_WORD *)buf = 0;
    v25 = "Rejected software update due to missing or malformed update array.";
LABEL_26:
    _os_log_impl(&dword_222CB9000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
    goto LABEL_36;
  }
  if ((objc_msgSend(CFSTR("Default"), "isEqualToString:", CFSTR("Default")) & 1) == 0)
  {
    v22 = objc_msgSend(CFSTR("Default"), "isEqualToString:", CFSTR("DownloadOnly"));
    v23 = objc_msgSend(CFSTR("Default"), "isEqualToString:", CFSTR("InstallASAP"));
    if ((v22 & 1) == 0 && (v23 & 1) == 0)
    {
      v24 = *(NSObject **)(DMCLogObjects() + 8);
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        goto LABEL_36;
      *(_WORD *)buf = 0;
      v25 = "Rejected software update due to install action being non-default, non-download only nor immediate install actions.";
      goto LABEL_26;
    }
  }
  v26 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v11 = "MDM Schedule OS update end.";
    v12 = v26;
    v13 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_29;
  }
LABEL_38:

}

- (void)_availableOSUpdates:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const __CFString *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  void *v44;
  uint8_t buf[4];
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v11, OS_LOG_TYPE_DEFAULT, "Available OS update start.", buf, 2u);
  }
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __59__MDMParser__availableOSUpdates_assertion_completionBlock___block_invoke;
  v41[3] = &unk_24EB689E0;
  v41[4] = self;
  v12 = v8;
  v42 = v12;
  v13 = v10;
  v43 = v13;
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x22767CBAC](v41);
  if (-[MDMParser _rejectSoftwareUpdateBecauseUserLoggedInCompletionBlock:](self, "_rejectSoftwareUpdateBecauseUserLoggedInCompletionBlock:", v14))
  {
    v15 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v16 = "Can't fetch available updates due to user logged in.";
LABEL_9:
      _os_log_impl(&dword_222CB9000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
      goto LABEL_36;
    }
    goto LABEL_36;
  }
  v17 = objc_msgSend((id)objc_opt_class(), "_shouldUseDelayWithRequest:", v12);
  if (v17 != 2)
  {
    v18 = v17;
    v19 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = CFSTR("NO");
      if (v18 == 1)
        v20 = CFSTR("YES");
      *(_DWORD *)buf = 138543362;
      v46 = (uint64_t)v20;
      _os_log_impl(&dword_222CB9000, v19, OS_LOG_TYPE_DEFAULT, "availableOSUpdates useDelay = %{public}@", buf, 0xCu);
    }
    v21 = v18 == 1;
    v22 = (void *)objc_opt_new();
    objc_msgSend(v22, "setUseDelay:", v21);
    objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    objc_msgSend(v23, "performRequest:error:", v22, &v40);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v40;

    if (v24 || !v25)
    {
      if (v24)
      {
        objc_msgSend(v24, "update");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          objc_msgSend((id)objc_opt_class(), "_updateDictionaryFromUpdate:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v31;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
          v38 = objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v38 = MEMORY[0x24BDBD1A8];
        }
        v34 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v46 = v38;
          _os_log_impl(&dword_222CB9000, v34, OS_LOG_TYPE_DEFAULT, "Returning updates array: %{public}@", buf, 0xCu);
        }
        +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"), v38);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_msgSend(v35, "mutableCopy");

        objc_msgSend(v36, "setObject:forKeyedSubscript:", v39, CFSTR("AvailableOSUpdates"));
        ((void (**)(_QWORD, void *))v14)[2](v14, v36);
        v37 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_222CB9000, v37, OS_LOG_TYPE_DEFAULT, "Available OS update end.", buf, 2u);
        }

        goto LABEL_35;
      }
      if (!v25)
        -[MDMParser _availableOSUpdates:assertion:completionBlock:].cold.1();
    }
    else
    {
      objc_msgSend(v25, "domain");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v26, "isEqualToString:", *MEMORY[0x24BE2C728]) & 1) != 0)
      {
        v27 = objc_msgSend(v25, "code");

        if (v27 == 2213)
        {
          v28 = *(NSObject **)(DMCLogObjects() + 8);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_222CB9000, v28, OS_LOG_TYPE_DEFAULT, "No updates available.", buf, 2u);
          }
          +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_msgSend(v29, "mutableCopy");

          objc_msgSend(v30, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1A8], CFSTR("AvailableOSUpdates"));
          ((void (**)(_QWORD, void *))v14)[2](v14, v30);
LABEL_35:

          goto LABEL_36;
        }
      }
      else
      {

      }
    }
    objc_msgSend((id)objc_opt_class(), "_errorFromDMFSoftwareUpdateError:", v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v46 = (uint64_t)v30;
      _os_log_impl(&dword_222CB9000, v32, OS_LOG_TYPE_ERROR, "Could not check for available iOS updates - %{public}@", buf, 0xCu);
    }
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v14)[2](v14, v33);

    goto LABEL_35;
  }
  -[MDMParser _rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:](self, "_rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:", v14);
  v15 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v16 = "Rejected software update due to \"use delay\" bad request.";
    goto LABEL_9;
  }
LABEL_36:

}

void __59__MDMParser__availableOSUpdates_assertion_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)_statusOfOSUpdates:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  unint64_t v21;
  void *v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __58__MDMParser__statusOfOSUpdates_assertion_completionBlock___block_invoke;
  v36[3] = &unk_24EB689E0;
  v36[4] = self;
  v11 = v8;
  v37 = v11;
  v12 = v10;
  v38 = v12;
  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x22767CBAC](v36);
  v14 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v14, OS_LOG_TYPE_DEFAULT, "Status of OS update start.", buf, 2u);
  }
  if (-[MDMParser _rejectSoftwareUpdateBecauseUserLoggedInCompletionBlock:](self, "_rejectSoftwareUpdateBecauseUserLoggedInCompletionBlock:", v13))
  {
    v15 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v15, OS_LOG_TYPE_ERROR, "Can't fetch OS update status due to user logged in.", buf, 2u);
    }
  }
  else
  {
    v16 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BE2C7E0], "systemConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(v17, "performRequest:error:", v16, &v35);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v35;

    if (v18)
    {
      v20 = (void *)objc_opt_new();
      v21 = objc_msgSend(v18, "status");
      if (v21 <= 2)
        objc_msgSend(v20, "setObject:forKeyedSubscript:", off_24EB69000[v21], CFSTR("Status"));
      objc_msgSend(v18, "productKey");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("ProductKey"));

      objc_msgSend(v18, "downloadPercentComplete");
      if (v23 < 1.0)
        v24 = MEMORY[0x24BDBD1C0];
      else
        v24 = MEMORY[0x24BDBD1C8];
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, CFSTR("IsDownloaded"));
      v25 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v18, "downloadPercentComplete");
      objc_msgSend(v25, "numberWithDouble:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v26, CFSTR("DownloadPercentComplete"));

      +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v27, "mutableCopy");

      v39 = v20;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, CFSTR("OSUpdateStatus"));

      v30 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v41 = v18;
        _os_log_impl(&dword_222CB9000, v30, OS_LOG_TYPE_DEFAULT, "OSUpdateStatus DMF raw data: %{public}@", buf, 0xCu);
      }
      v31 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v41 = v28;
        _os_log_impl(&dword_222CB9000, v31, OS_LOG_TYPE_DEFAULT, "OSUpdateStatus response: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (!v19)
        -[MDMParser _statusOfOSUpdates:assertion:completionBlock:].cold.1();
      objc_msgSend((id)objc_opt_class(), "_errorFromDMFSoftwareUpdateError:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v41 = v20;
        _os_log_impl(&dword_222CB9000, v32, OS_LOG_TYPE_ERROR, "Could not check for iOS update status - %{public}@", buf, 0xCu);
      }
      +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v20);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v33, "mutableCopy");

    }
    ((void (**)(_QWORD, void *))v13)[2](v13, v28);
    v34 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v34, OS_LOG_TYPE_DEFAULT, "Status of OS update end.", buf, 2u);
    }

  }
}

void __58__MDMParser__statusOfOSUpdates_assertion_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsMDMCommandEventWithRequest:response:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

+ (id)_errorWithDomain:(id)a3 code:(int64_t)a4 descriptionKey:(id)a5 underlyingError:(id)a6 type:(id)a7
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = (void *)MEMORY[0x24BDD1540];
  v11 = a7;
  v12 = a6;
  v13 = a3;
  DMCUnformattedErrorArray();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v13, a4, v14, v12, v11, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_errorFromDMFSoftwareUpdateError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  switch(objc_msgSend(v3, "code"))
  {
    case 2200:
      v4 = (void *)objc_opt_class();
      v5 = *MEMORY[0x24BE2A728];
      v6 = *MEMORY[0x24BE2A588];
      v7 = CFSTR("MDM_ERROR_SU_DOWNLOAD_IN_PROGRESS");
      v8 = 12051;
      goto LABEL_18;
    case 2201:
      v4 = (void *)objc_opt_class();
      v5 = *MEMORY[0x24BE2A728];
      v6 = *MEMORY[0x24BE2A588];
      v7 = CFSTR("MDM_ERROR_SU_DOWNLOAD_COMPLETE");
      v8 = 12052;
      goto LABEL_18;
    case 2202:
      v4 = (void *)objc_opt_class();
      v5 = *MEMORY[0x24BE2A728];
      v6 = *MEMORY[0x24BE2A588];
      v7 = CFSTR("MDM_ERROR_SU_DOWNLOAD_FAILED");
      v8 = 12057;
      goto LABEL_18;
    case 2203:
      v4 = (void *)objc_opt_class();
      v5 = *MEMORY[0x24BE2A728];
      v6 = *MEMORY[0x24BE2A588];
      v7 = CFSTR("MDM_ERROR_SU_DOWNLOAD_INSUFFICIENT_NETWORK");
      v8 = 12056;
      goto LABEL_18;
    case 2204:
      v4 = (void *)objc_opt_class();
      v5 = *MEMORY[0x24BE2A728];
      v6 = *MEMORY[0x24BE2A588];
      v7 = CFSTR("MDM_ERROR_SU_DOWNLOAD_INSUFFICIENT_SPACE");
      v8 = 12054;
      goto LABEL_18;
    case 2205:
      v4 = (void *)objc_opt_class();
      v5 = *MEMORY[0x24BE2A728];
      v6 = *MEMORY[0x24BE2A588];
      v7 = CFSTR("MDM_ERROR_SU_DOWNLOAD_INSUFFICIENT_POWER");
      v8 = 12055;
      goto LABEL_18;
    case 2206:
      v4 = (void *)objc_opt_class();
      v5 = *MEMORY[0x24BE2A728];
      v6 = *MEMORY[0x24BE2A588];
      v7 = CFSTR("MDM_ERROR_SU_DOWNLOAD_REQUIRES_COMPUTER");
      v8 = 12053;
      goto LABEL_18;
    case 2207:
      v4 = (void *)objc_opt_class();
      v5 = *MEMORY[0x24BE2A728];
      v6 = *MEMORY[0x24BE2A588];
      v7 = CFSTR("MDM_ERROR_SU_INSTALL_IN_PROGRESS");
      v8 = 12058;
      goto LABEL_18;
    case 2208:
      v4 = (void *)objc_opt_class();
      v5 = *MEMORY[0x24BE2A728];
      v6 = *MEMORY[0x24BE2A588];
      v7 = CFSTR("MDM_ERROR_SU_INSTALL_FAILED");
      v8 = 12062;
      goto LABEL_18;
    case 2209:
      v4 = (void *)objc_opt_class();
      v5 = *MEMORY[0x24BE2A728];
      v6 = *MEMORY[0x24BE2A588];
      v7 = CFSTR("MDM_ERROR_SU_INSTALL_INSUFFICIENT_SPACE");
      v8 = 12060;
      goto LABEL_18;
    case 2210:
      v4 = (void *)objc_opt_class();
      v5 = *MEMORY[0x24BE2A728];
      v6 = *MEMORY[0x24BE2A588];
      v7 = CFSTR("MDM_ERROR_SU_INSTALL_INSUFFICIENT_POWER");
      v8 = 12061;
      goto LABEL_18;
    case 2211:
      v4 = (void *)objc_opt_class();
      v5 = *MEMORY[0x24BE2A728];
      v6 = *MEMORY[0x24BE2A588];
      v7 = CFSTR("MDM_ERROR_SU_INSTALL_REQUIRES_DOWNLOAD");
      v8 = 12059;
      goto LABEL_18;
    case 2212:
      v4 = (void *)objc_opt_class();
      v5 = *MEMORY[0x24BE2A728];
      v6 = *MEMORY[0x24BE2A588];
      v7 = CFSTR("MDM_ERROR_SU_DEVICE_PASSCODE_MUST_BE_CLEARED");
      v8 = 12049;
      goto LABEL_18;
    case 2213:
      v4 = (void *)objc_opt_class();
      v5 = *MEMORY[0x24BE2A728];
      v6 = *MEMORY[0x24BE2A588];
      v7 = CFSTR("MDM_ERROR_SU_NO_UPDATE_AVAILABLE");
      v8 = 12048;
      goto LABEL_18;
    case 2214:
      v4 = (void *)objc_opt_class();
      v5 = *MEMORY[0x24BE2A728];
      v6 = *MEMORY[0x24BE2A588];
      v7 = CFSTR("MDM_ERROR_SU_SCAN_FAILED");
      v8 = 12050;
LABEL_18:
      objc_msgSend(v4, "_errorWithDomain:code:descriptionKey:underlyingError:type:", v5, v8, v7, v3, v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v9 = (void *)MEMORY[0x24BDD1540];
      v10 = *MEMORY[0x24BE2A630];
      v11 = *MEMORY[0x24BDD1398];
      v15[0] = *MEMORY[0x24BDD0FC8];
      v15[1] = v11;
      v16[0] = CFSTR("Unknown software update error");
      v16[1] = v3;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 3, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      break;
  }

  return v13;
}

+ (BOOL)_dmfAction:(unint64_t *)a3 fromMDMActionString:(id)a4
{
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  BOOL v13;

  objc_msgSend(a4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("DownloadOnly"), "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(CFSTR("InstallASAP"), "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "isEqualToString:", v9);

    if ((v10 & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(CFSTR("Default"), "lowercaseString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v5, "isEqualToString:", v11);

      if (!v12)
      {
        v13 = 0;
        goto LABEL_8;
      }
      v8 = 2;
    }
  }
  *a3 = v8;
  v13 = 1;
LABEL_8:

  return v13;
}

+ (id)_resolvedInstallActionStringForAction:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("InstallASAP");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return (id)v3;
  else
    return CFSTR("DownloadOnly");
}

+ (unint64_t)_shouldUseDelayWithRequest:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_useDelayFlagAllowed"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("UseDelay"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      v5 = 2;
    else
      v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_statusFromError:(id)a3 action:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE2C728]);

    if (v8 && (v9 = objc_msgSend(v6, "code"), (unint64_t)(v9 - 2200) <= 0xC))
      v10 = off_24EB69018[v9 - 2200];
    else
      v10 = CFSTR("Idle");
  }
  else
  {
    v11 = CFSTR("Idle");
    if (a4 == 1)
      v11 = CFSTR("Installing");
    if (a4)
      v10 = v11;
    else
      v10 = CFSTR("Downloading");
  }

  return (id)v10;
}

+ (id)_updateDictionaryFromUpdate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "productKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "productKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("ProductKey"));

    }
    objc_msgSend(v3, "humanReadableName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "humanReadableName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("HumanReadableName"));

    }
    objc_msgSend(v3, "productName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v3, "productName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("ProductName"));

    }
    objc_msgSend(v3, "version");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v3, "version");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("Version"));

    }
    objc_msgSend(v3, "build");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v3, "build");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("Build"));

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "downloadSize"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("DownloadSize"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "installSize"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("InstallSize"));

    v17 = objc_msgSend(v3, "isCritical");
    v18 = MEMORY[0x24BDBD1C0];
    v19 = MEMORY[0x24BDBD1C8];
    if (v17)
      v20 = MEMORY[0x24BDBD1C8];
    else
      v20 = MEMORY[0x24BDBD1C0];
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("IsCritical"));
    if (objc_msgSend(v3, "restartRequired"))
      v21 = v19;
    else
      v21 = v18;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("RestartRequired"));
    if (objc_msgSend(v3, "allowsInstallLater"))
      v22 = v19;
    else
      v22 = v18;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("AllowsInstallLater"));
    if (objc_msgSend(v3, "isSplat"))
      v23 = v19;
    else
      v23 = v18;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("IsSecurityResponse"));
    objc_msgSend(v3, "supplementalBuild");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v3, "supplementalBuild");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("SupplementalBuildVersion"));

    }
    objc_msgSend(v3, "supplementalVersionExtra");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v3, "supplementalVersionExtra");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("SupplementalOSVersionExtra"));

    }
    v28 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

+ (BOOL)_useDelayFlagAllowed
{
  void *v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("MCUseSoftwareUpdateDelayFlagAllowed"));

  v4 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("NO");
    if (v3)
      v5 = CFSTR("YES");
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_INFO, "useDelayFlagAllowed = %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return v3;
}

- (id)_responseForMalformedUpdateRequest
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12008, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = CFSTR("ProductKey");
  v9[1] = CFSTR("InstallAction");
  v10[0] = &stru_24EB6A400;
  v10[1] = CFSTR("Error");
  v10[2] = CFSTR("Idle");
  v9[2] = CFSTR("Status");
  v9[3] = CFSTR("ErrorChain");
  objc_msgSend((id)objc_opt_class(), "errorChainFromError:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_rejectSoftwareUpdateBecauseUserLoggedInCompletionBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;

  v4 = (void (**)(id, void *))a3;
  if (objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad"))
  {
    objc_msgSend((id)DMCUMUserManagerClass(), "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentUser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isLoginUser");
    v8 = v7 ^ 1;

    if (v4 && (v7 & 1) == 0)
    {
      -[MDMParser _softwareUpdatesNotPermittedWithLoggedInUserError](self, "_softwareUpdatesNotPermittedWithLoggedInUserError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v4[2](v4, v10);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_rejectSoftwareUpdateBecauseOfMalformedRequestCompletionBlock:(id)a3
{
  void (**v3)(id, id);
  void *v4;
  id v5;

  if (a3)
  {
    v3 = (void (**)(id, id))a3;
    +[MDMParser malformedRequestErrorResult](MDMParser, "malformedRequestErrorResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "mutableCopy");

    v3[2](v3, v5);
  }
}

- (id)_softwareUpdatesNotPermittedWithLoggedInUserError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12077, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_sendAnalyticsMDMCommandEventWithRequest:(id)a3 response:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a3)
  {
    if (a4)
    {
      v6 = (void *)MEMORY[0x24BE60D68];
      v7 = a4;
      v8 = a3;
      objc_msgSend(v6, "sharedConfiguration");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMParser _analyticsCommandNameFromRequest:](self, "_analyticsCommandNameFromRequest:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMParser _analyticsErrorFromResponse:](self, "_analyticsErrorFromResponse:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[MDMParser _analyticsRequiresNetworkTetheringFromRequest:](self, "_analyticsRequiresNetworkTetheringFromRequest:", v8);
      objc_msgSend(v12, "isTeslaEnrolled");
      objc_msgSend(v12, "isSupervised");
      objc_msgSend(v9, "isUserEnrollment");
      objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad");
      MDMAnalyticsSendCommandEvent(v10, v11);

    }
  }
}

- (id)_analyticsCommandNameFromRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RequestType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("InstallApplication")))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Options"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PurchaseMethod"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "intValue") == 1)
      v7 = CFSTR("%@.vpp");
    else
      v7 = CFSTR("%@.legacy");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v7, v4);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }

  return v4;
}

- (BOOL)_analyticsRequiresNetworkTetheringFromRequest:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RequestRequiresNetworkTether"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)_analyticsErrorFromResponse:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ErrorObject"));
}

+ (id)errorChainFromError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v15;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v15 = v3;
  if (v15)
  {
    v5 = *MEMORY[0x24BDD1398];
    v6 = v15;
    do
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "DMCSetObjectIfNotNil:forKey:", v9, CFSTR("LocalizedDescription"));

      objc_msgSend(v6, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "DMCSetObjectIfNotNil:forKey:", v10, CFSTR("ErrorDomain"));

      objc_msgSend(v6, "DMCUSEnglishDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "DMCSetObjectIfNotNil:forKey:", v11, CFSTR("USEnglishDescription"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "code"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v12, CFSTR("ErrorCode"));

      objc_msgSend(v4, "addObject:", v7);
      objc_msgSend(v8, "objectForKey:", v5);
      v13 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v13;
    }
    while (v13);
  }

  return v4;
}

+ (id)malformedRequestErrorResult
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12008, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_invalidRequestTypeError:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 12021, v5, *MEMORY[0x24BE2A588], a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_notAuthorizedError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12007, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_notManagedErrorAppID:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 12038, v5, *MEMORY[0x24BE2A588], a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_invalidRequestTypeInMDMLostModeError:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 12078, v5, *MEMORY[0x24BE2A588], a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_invalidRequestTypeInSingleAppModeError:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 12084, v5, *MEMORY[0x24BE2A588], a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_notNetworkTetheredError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12081, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_installApplicationCouldNotModifyDDMAppsError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12008, v4, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_managedByDDMError:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 12126, v5, *MEMORY[0x24BE2A588], a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_appAttributesWithRequestedAttributes:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x24BE2A7F0], "forceAppInstallUnremovability"))
  {
    if (v3)
    {
      v4 = (void *)objc_msgSend(v3, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE60FC0]);

    v3 = v5;
  }
  return v3;
}

- (id)_appManagementFlagsWithRequestedFlags:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a3, "unsignedIntegerValue");
  v4 = v3 | objc_msgSend(MEMORY[0x24BE2A7F0], "forceAppRemovalOnUnenroll");
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4);
}

- (BOOL)_isPurchaseMethodAllowed:(int)a3 onUserEnrollment:(BOOL)a4
{
  BOOL result;

  result = a3 == 1;
  if (a3 != 1 && !a4)
  {
    if ((objc_msgSend(MEMORY[0x24BE2A818], "isAppleTV") & 1) != 0)
      return 0;
    else
      return objc_msgSend(MEMORY[0x24BE2A818], "isVisionDevice") ^ 1;
  }
  return result;
}

- (BOOL)_isChlorineEligible
{
  int domain_answer;
  NSObject *v3;
  _BOOL4 v4;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  domain_answer = os_eligibility_get_domain_answer();
  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (domain_answer)
  {
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v7) = domain_answer;
      _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_ERROR, "Eligibility check failed with error code: %d", buf, 8u);
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v7 = 0;
      _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_DEBUG, "isChlorineEligible: %llu", buf, 0xCu);
    }
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (MDMServerCore)server
{
  return (MDMServerCore *)objc_loadWeakRetained((id *)&self->_server);
}

- (void)setServer:(id)a3
{
  objc_storeWeak((id *)&self->_server, a3);
}

- (BOOL)isChaperoned
{
  return self->_isChaperoned;
}

- (BOOL)isMDM
{
  return self->_isMDM;
}

- (void)setIsMDM:(BOOL)a3
{
  self->_isMDM = a3;
}

- (NSString)managingProfileIdentifier
{
  return self->_managingProfileIdentifier;
}

- (void)setManagingProfileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_managingProfileIdentifier, a3);
}

- (CATOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (MDMBackupManager)backupManagerForMainPersona
{
  return self->_backupManagerForMainPersona;
}

- (void)setBackupManagerForMainPersona:(id)a3
{
  objc_storeStrong((id *)&self->_backupManagerForMainPersona, a3);
}

- (MDMBackupManager)backupManagerForEnterprisePersona
{
  return self->_backupManagerForEnterprisePersona;
}

- (void)setBackupManagerForEnterprisePersona:(id)a3
{
  objc_storeStrong((id *)&self->_backupManagerForEnterprisePersona, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupManagerForEnterprisePersona, 0);
  objc_storeStrong((id *)&self->_backupManagerForMainPersona, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_managingProfileIdentifier, 0);
  objc_destroyWeak((id *)&self->_server);
}

- (void)_availableOSUpdates:assertion:completionBlock:.cold.1()
{
  __assert_rtn("-[MDMParser _availableOSUpdates:assertion:completionBlock:]", "MDMParser.m", 6099, "dmfError != nil");
}

- (void)_statusOfOSUpdates:assertion:completionBlock:.cold.1()
{
  __assert_rtn("-[MDMParser _statusOfOSUpdates:assertion:completionBlock:]", "MDMParser.m", 6153, "dmfError != nil");
}

@end
