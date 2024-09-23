@implementation EMMessageRepositoryQueryObserver

void __83___EMMessageRepositoryQueryObserver__performQueryWithRemoteConnection_forRecovery___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addCancelable:");

}

void __65___EMMessageRepositoryQueryObserver_recoverWithRemoteConnection___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  os_unfair_lock_s *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 16);
    v4 = *(_QWORD *)&v3[18]._os_unfair_lock_opaque;
    LOBYTE(v3[20]._os_unfair_lock_opaque) = 0;
    os_unfair_lock_unlock(v3 + 16);
    if (v4)
    {
      +[EMMessageRepository log](EMMessageRepository, "log");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)&v3[26]._os_unfair_lock_opaque;
        v7 = *(_QWORD *)(a1 + 48);
        v8 = *(_QWORD *)&v3[4]._os_unfair_lock_opaque;
        v13 = 134218754;
        v14 = v3;
        v15 = 2114;
        v16 = v6;
        v17 = 2048;
        v18 = v7;
        v19 = 2048;
        v20 = v8;
        _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Observer:%{public}@ attempting recovery %ld for query<%p>", (uint8_t *)&v13, 0x2Au);
      }

      -[os_unfair_lock_s _performQueryWithRemoteConnection:forRecovery:](v3, "_performQueryWithRemoteConnection:forRecovery:", *(_QWORD *)(a1 + 32), 1);
    }
    else
    {
      +[EMMessageRepository log](EMMessageRepository, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)&v3[26]._os_unfair_lock_opaque;
        v11 = *(_QWORD *)(a1 + 48);
        v12 = *(_QWORD *)&v3[4]._os_unfair_lock_opaque;
        v13 = 134218754;
        v14 = v3;
        v15 = 2114;
        v16 = v10;
        v17 = 2048;
        v18 = v11;
        v19 = 2048;
        v20 = v12;
        _os_log_impl(&dword_1B99BB000, v9, OS_LOG_TYPE_DEFAULT, "<%p> Observer:%{public}@ skipping recovery %ld for query<%p> since it has already recovered", (uint8_t *)&v13, 0x2Au);
      }

    }
  }

}

uint64_t __85___EMMessageRepositoryQueryObserver_observer_matchedAddedObjectIDs_before_extraInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observer:matchedChangesForObjectIDs:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __84___EMMessageRepositoryQueryObserver_observer_matchedAddedObjectIDs_after_extraInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observer:matchedChangesForObjectIDs:", *(_QWORD *)(a1 + 40), a2);
}

@end
