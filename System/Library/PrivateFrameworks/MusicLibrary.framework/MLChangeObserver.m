@implementation MLChangeObserver

void __38___MLChangeObserver_setupTimeoutTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_DWORD *)(a1 + 56);
      v9 = 134218498;
      v10 = WeakRetained;
      v11 = 2114;
      v12 = v5;
      v13 = 1024;
      v14 = v6;
      _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "_MLChangeObserver %p - Terminating hanging client %{public}@[%d]", (uint8_t *)&v9, 0x1Cu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 12));
    objc_msgSend(WeakRetained, "tearDownTaskAssertion");
    objc_msgSend(WeakRetained, "terminateForFailureToPerformDatabasePathChange");
    objc_msgSend(WeakRetained, "tearDownTimeoutTimer");
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 12));
  }
  else
  {
    if (v4)
    {
      v7 = *(void **)(a1 + 32);
      v8 = *(_DWORD *)(a1 + 56);
      v9 = 138543618;
      v10 = v7;
      v11 = 1024;
      LODWORD(v12) = v8;
      _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "_MLChangeObserver - Terminating hanging client %{public}@[%d] [aborted: dead connection]", (uint8_t *)&v9, 0x12u);
    }

  }
}

void __67___MLChangeObserver_terminateForFailureToPerformDatabasePathChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_ERROR, "%{public}@ - terminateForFailureToPerformDatabasePathChange - Unable to retrieve remote object proxy - error=%{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __58___MLChangeObserver_performDatabasePathChange_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  os_unfair_lock_s *v4;
  id v5;

  v4 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 12);
  v5 = a3;
  os_unfair_lock_lock(v4);
  objc_msgSend(*(id *)(a1 + 32), "tearDownTaskAssertion");
  objc_msgSend(*(id *)(a1 + 32), "tearDownTimeoutTimer");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __58___MLChangeObserver_performDatabasePathChange_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_ERROR, "%{public}@ - performDatabasePathChange: - Unable to retrieve remote object proxy - error=%{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __58___MLChangeObserver_performDatabasePathChange_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - performDatabasePathChange: [done]", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
