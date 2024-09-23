@implementation HKWorkoutObserver

void __42___HKWorkoutObserver_initWithHealthStore___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_startTaskServerIfNeeded");

}

void __34___HKWorkoutObserver_setDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  if (*(_QWORD *)(a1 + 40))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v2 + 24))
    {
      objc_msgSend(*(id *)(v2 + 56), "clientQueue");
      v3 = objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __34___HKWorkoutObserver_setDelegate___block_invoke_2;
      v6[3] = &unk_1E37E6980;
      v4 = *(id *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 32);
      v7 = v4;
      v8 = v5;
      dispatch_async(v3, v6);

    }
  }
}

uint64_t __34___HKWorkoutObserver_setDelegate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateWorkoutSnapshot:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
}

void __30___HKWorkoutObserver_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

void __59___HKWorkoutObserver_currentWorkoutSnapshotWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59___HKWorkoutObserver_currentWorkoutSnapshotWithCompletion___block_invoke_2;
  block[3] = &unk_1E37E6710;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __59___HKWorkoutObserver_currentWorkoutSnapshotWithCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __59___HKWorkoutObserver_currentWorkoutSnapshotWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v2 = *(void **)(v1 + 40);
    v4 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = _Block_copy(v4);
    objc_msgSend(v2, "addObject:", v3);

  }
}

void __68___HKWorkoutObserver_waitForAutomaticWorkoutRecoveryWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "clientQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68___HKWorkoutObserver_waitForAutomaticWorkoutRecoveryWithCompletion___block_invoke_2;
  block[3] = &unk_1E37E6CD0;
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

}

uint64_t __68___HKWorkoutObserver_waitForAutomaticWorkoutRecoveryWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68___HKWorkoutObserver_waitForAutomaticWorkoutRecoveryWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_waitForAutomaticWorkoutRecoveryWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __68___HKWorkoutObserver_waitForAutomaticWorkoutRecoveryWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __68___HKWorkoutObserver_waitForAutomaticWorkoutRecoveryWithCompletion___block_invoke_4_cold_1(a1, (uint64_t)v3, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __43___HKWorkoutObserver_connectionInterrupted__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

uint64_t __60___HKWorkoutObserver_clientRemote_didUpdateWorkoutSnapshot___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
}

void __60___HKWorkoutObserver_clientRemote_didUpdateWorkoutSnapshot___block_invoke_2(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "didUpdateWorkoutSnapshot:", a1[4]);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __46___HKWorkoutObserver__startTaskServerIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_startTaskServerIfNeeded");
}

uint64_t __51___HKWorkoutObserver__lock_startTaskServerIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startTaskServerIfNeeded");
}

void __51___HKWorkoutObserver__lock_startTaskServerIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR))
    __51___HKWorkoutObserver__lock_startTaskServerIfNeeded__block_invoke_2_cold_1(a1, (uint64_t)v3, v4);

}

void __68___HKWorkoutObserver_waitForAutomaticWorkoutRecoveryWithCompletion___block_invoke_4_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_19A0E6000, a2, a3, "%{public}@: Failed to register for automatic workout recovery completion: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

void __51___HKWorkoutObserver__lock_startTaskServerIfNeeded__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_19A0E6000, a2, a3, "Unable to fetch workout observer %@ proxy after interrupted connection with error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

@end
