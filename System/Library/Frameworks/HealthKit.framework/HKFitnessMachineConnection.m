@implementation HKFitnessMachineConnection

void __51___HKFitnessMachineConnection_initWithHealthStore___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_registerClient");

}

void __42___HKFitnessMachineConnection_description__block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  unint64_t v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  if (v8 > 6)
    v9 = 0;
  else
    v9 = off_1E37F04E0[v8];
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (v10 > 4)
    v11 = 0;
  else
    v11 = off_1E37F0518[v10];
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@ %p> %@ connectionState: %@ machineState: %@ %@"), v15, v4, v6, v9, v11, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

uint64_t __46___HKFitnessMachineConnection_markClientReady__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_markClientReady");
}

uint64_t __46___HKFitnessMachineConnection_markClientReady__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientRemote_deliverFailedWithError:", a2);
}

uint64_t __46___HKFitnessMachineConnection__registerClient__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_registerClient:", *(_QWORD *)(a1 + 32));
}

uint64_t __46___HKFitnessMachineConnection__registerClient__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientRemote_deliverFailedWithError:", a2);
}

uint64_t __34___HKFitnessMachineConnection_end__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_endFitnessMachineConnection");
}

uint64_t __34___HKFitnessMachineConnection_end__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientRemote_deliverFailedWithError:", a2);
}

uint64_t __64___HKFitnessMachineConnection_endWithFitnessMachineSessionUUID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_endFitnessMachineConnectionForFitnessMachineSessionUUID:", *(_QWORD *)(a1 + 32));
}

uint64_t __64___HKFitnessMachineConnection_endWithFitnessMachineSessionUUID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientRemote_deliverFailedWithError:", a2);
}

void __58___HKFitnessMachineConnection_currentSessionConfiguration__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setConnectionUUID:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_setSessionUUID:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setMachineUUID:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_setMachineType:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "type"));
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setMachineName:", v8);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "brand");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setMachineBrand:", v10);

}

void __52___HKFitnessMachineConnection_deviceForFinalWorkout__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  HKDevice *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  if (!v3)
  {
    objc_msgSend(*(id *)(v2 + 24), "brand");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = -[HKDevice initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:]([HKDevice alloc], "initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:", v4, v4, 0, 0, 0, 0, CFSTR("com.healthd.fitnessmachine"), 0);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 32);
      *(_QWORD *)(v6 + 32) = v5;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "_setFitnessMachineType:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "type"));
    }

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  v8 = objc_msgSend(v3, "copy");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __63___HKFitnessMachineConnection_clientRemote_deliverDetectedNFC___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

void __63___HKFitnessMachineConnection_clientRemote_deliverDetectedNFC___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  char v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
      objc_msgSend(v6, "fitnessMachineConnectionDetectedNFC:fitnessMachineSessionUUID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
  }
}

void __77___HKFitnessMachineConnection_clientRemote_deliverMachineInformationUpdated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = 0;

}

void __77___HKFitnessMachineConnection_clientRemote_deliverMachineInformationUpdated___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(v4, "fitnessMachineConnection:machineInformationUpdated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

uint64_t __114___HKFitnessMachineConnection_clientRemote_deliverMachineChangedToState_fromState_fitnessMachineSessionUUID_date___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 48) = *(_QWORD *)(result + 40);
  return result;
}

void __114___HKFitnessMachineConnection_clientRemote_deliverMachineChangedToState_fromState_fitnessMachineSessionUUID_date___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(a1[4] + 64));
    objc_msgSend(v4, "fitnessMachineConnection:machineChangedToState:fromState:fitnessMachineSessionUUID:date:", a1[4], a1[7], a1[8], a1[5], a1[6]);

  }
}

void __118___HKFitnessMachineConnection_clientRemote_deliverConnectionChangedToState_fromState_fitnessMachineSessionUUID_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v2 = a1 + 32;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  if (!v4)
    goto LABEL_4;
  if (objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    v3 = *(_QWORD *)v2;
LABEL_4:
    objc_storeStrong((id *)(v3 + 16), *(id *)(a1 + 40));
    goto LABEL_8;
  }
  _HKInitializeLogging();
  v5 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __118___HKFitnessMachineConnection_clientRemote_deliverConnectionChangedToState_fromState_fitnessMachineSessionUUID_error___block_invoke_cold_1(v2, (uint64_t *)(a1 + 40), v5);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = 0;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("SessionID mismatch."));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

LABEL_8:
  v11 = *(_QWORD *)v2;
  if (*(_QWORD *)(*(_QWORD *)v2 + 56) == 5)
  {
    v12 = *(void **)(v11 + 16);
    *(_QWORD *)(v11 + 16) = 0;

    v13 = *(void **)(*(_QWORD *)v2 + 32);
    *(_QWORD *)(*(_QWORD *)v2 + 32) = 0;

  }
}

void __118___HKFitnessMachineConnection_clientRemote_deliverConnectionChangedToState_fromState_fitnessMachineSessionUUID_error___block_invoke_26(_QWORD *a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  v2 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  v3 = (id *)a1[4];
  if (v2)
  {
    objc_msgSend(v3, "_clientQueue_deliverFailedWithError:");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(v3 + 8);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      v6 = objc_loadWeakRetained((id *)(a1[4] + 64));
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v8 = objc_loadWeakRetained((id *)(a1[4] + 64));
        objc_msgSend(v8, "fitnessMachineConnection:connectionChangedToState:fromState:fitnessMachineSessionUUID:error:", a1[4], a1[8], a1[9], a1[5], a1[6]);

      }
    }
  }
}

uint64_t __67___HKFitnessMachineConnection_clientRemote_deliverFailedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clientQueue_deliverFailedWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __50___HKFitnessMachineConnection__simulateDisconnect__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_simulateDisconnect");
}

void __50___HKFitnessMachineConnection__simulateDisconnect__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _HKInitializeLogging();
  v3 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEFAULT, "Failed to simulate disconnect: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __63___HKFitnessMachineConnection__connectionInterruptedWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  char v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
      objc_msgSend(v6, "fitnessMachineConnection:interruptedWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
  }
}

void __118___HKFitnessMachineConnection_clientRemote_deliverConnectionChangedToState_fromState_fitnessMachineSessionUUID_error___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "Error currentSessionID: %@ not equal to machineSessionID: %@", (uint8_t *)&v5, 0x16u);
}

@end
