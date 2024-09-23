@implementation HKDeepBreathingSession

uint64_t __48___HKDeepBreathingSession_connectionInvalidated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_deactivate");
}

void __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_2;
    block[3] = &unk_1E37E6798;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_4;
  v4[3] = &unk_1E37E67C0;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(a2, "remote_startSessionWithStartDate:completion:", v3, v4);

}

void __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];

  v5 = a3;
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(NSObject **)(v6 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_5;
    block[3] = &unk_1E37E6770;
    block[4] = v6;
    dispatch_sync(v7, block);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogDeepBreathing, OS_LOG_TYPE_ERROR))
      __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_4_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_transitionToServerState:", 3);
}

void __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogDeepBreathing, OS_LOG_TYPE_ERROR))
    __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_14_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __39___HKDeepBreathingSession_startGuiding__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startGuiding");
}

void __39___HKDeepBreathingSession_startGuiding__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogDeepBreathing, OS_LOG_TYPE_ERROR))
    __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_14_cold_1();

}

uint64_t __51___HKDeepBreathingSession_endSessionWithEndReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_endSessionWithEndReason:", *(_QWORD *)(a1 + 32));
}

void __51___HKDeepBreathingSession_endSessionWithEndReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogDeepBreathing, OS_LOG_TYPE_ERROR))
    __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_14_cold_1();

}

uint64_t __38___HKDeepBreathingSession_serverState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

uint64_t __56___HKDeepBreathingSession__connectionDidEncounterError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_deactivate");
  return objc_msgSend(*(id *)(a1 + 32), "_queue_alertDelegateDidEncounterError:", *(_QWORD *)(a1 + 40));
}

uint64_t __44___HKDeepBreathingSession__isServerAttached__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_isServerAttached");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __67___HKDeepBreathingSession_clientRemote_sessionDidReceiveHeartRate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_alertDelegateDidReceiveHeartRate:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_queue_deactivate");
}

uint64_t __63___HKDeepBreathingSession_clientRemote_sessionDidReceiveError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_alertDelegateDidEncounterError:", *(_QWORD *)(a1 + 40));
}

void __67___HKDeepBreathingSession__queue_alertDelegateDidReceiveHeartRate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "deepBreathingSession:didReceiveHeartRate:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));

}

void __65___HKDeepBreathingSession__queue_alertDelegateDidEncounterError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "deepBreathingSession:didEncounterError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "error starting session: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __64___HKDeepBreathingSession_startSessionWithStartDate_completion___block_invoke_14_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "received server error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
