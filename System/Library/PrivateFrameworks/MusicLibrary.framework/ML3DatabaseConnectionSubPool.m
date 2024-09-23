@implementation ML3DatabaseConnectionSubPool

void __52___ML3DatabaseConnectionSubPool_checkoutConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "anyObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "connection");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 65);

      if (v5)
        return;
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v6 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = 0;
    }
    else
    {
      v6 = v8;
    }

  }
}

void __64___ML3DatabaseConnectionSubPool_checkInConnection_returnToPool___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  char v9;

  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __64___ML3DatabaseConnectionSubPool_checkInConnection_returnToPool___block_invoke_2;
  block[3] = &unk_1E5B65AA0;
  v9 = *(_BYTE *)(a1 + 48);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[1] = 3221225472;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  dispatch_sync(v3, block);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 32));

}

uint64_t __64___ML3DatabaseConnectionSubPool_checkInConnection_returnToPool___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  _QWORD block[4];
  id v11;

  v2 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    objc_msgSend(v3, "flush");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "addObject:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v3, "close");

    objc_msgSend(*(id *)(a1 + 32), "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connectionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      dispatch_get_global_queue(0, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64___ML3DatabaseConnectionSubPool_checkInConnection_returnToPool___block_invoke_3;
      block[3] = &unk_1E5B65D80;
      v11 = *(id *)(a1 + 32);
      dispatch_async(v8, block);

    }
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "removeObject:", *(_QWORD *)(a1 + 32));
}

uint64_t __52___ML3DatabaseConnectionSubPool_checkoutConnection___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __52___ML3DatabaseConnectionSubPool_checkoutConnection___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  __objc2_class **v4;
  void *v5;
  _ML3DatabaseConnectionWrapper *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  __int128 v11;
  _QWORD block[4];
  __int128 v13;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1[4] + 32), 0xFFFFFFFFFFFFFFFFLL);
  v2 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52___ML3DatabaseConnectionSubPool_checkoutConnection___block_invoke_2;
  block[3] = &unk_1E5B65E48;
  v3 = *(NSObject **)(a1[4] + 24);
  v13 = *((_OWORD *)a1 + 2);
  dispatch_sync(v3, block);
  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    if (*(_BYTE *)(a1[4] + 65))
      v4 = off_1E5B4AB48;
    else
      v4 = off_1E5B4AB38;
    v5 = (void *)objc_msgSend(objc_alloc(*v4), "initWithDatabasePath:", *(_QWORD *)(a1[4] + 72));
    objc_msgSend(v5, "setReadOnly:", *(unsigned __int8 *)(a1[4] + 64));
    objc_msgSend(v5, "setJournalingMode:", *(_QWORD *)(a1[4] + 88));
    v6 = -[_ML3DatabaseConnectionWrapper initWithConnection:]([_ML3DatabaseConnectionWrapper alloc], "initWithConnection:", v5);
    v7 = *(_QWORD *)(a1[5] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v10[0] = v2;
    v10[1] = 3221225472;
    v10[2] = __52___ML3DatabaseConnectionSubPool_checkoutConnection___block_invoke_3;
    v10[3] = &unk_1E5B65E48;
    v9 = *(NSObject **)(a1[4] + 24);
    v11 = *((_OWORD *)a1 + 2);
    dispatch_sync(v9, v10);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;

  }
}

uint64_t __50___ML3DatabaseConnectionSubPool_isBusyConnection___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 48), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

void __50___ML3DatabaseConnectionSubPool_handleDiagnostic___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 64);
  objc_msgSend(*(id *)(v2 + 40), "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v5, "setReaderAvailableConnections:", v4);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allObjects");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setReaderBusyConnections:");
  }
  else
  {
    objc_msgSend(v5, "setWriterAvailableConnections:", v4);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allObjects");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setWriterBusyConnections:");
  }

}

uint64_t __75___ML3DatabaseConnectionSubPool_closeConnectionsAndWaitForBusyConnections___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t result;
  __int128 v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v18;
    *(_QWORD *)&v3 = 138543618;
    v15 = v3;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v6);
        v8 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v7, "debugDescription");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v15;
          v22 = v9;
          v23 = 2114;
          v24 = v10;
          _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ closing available connection=%{public}@", buf, 0x16u);

        }
        objc_msgSend(v7, "connection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "close");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v4);
  }

  if (!*(_BYTE *)(a1 + 56))
  {
    v12 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v13);

  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count", v15);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result != 0;
  return result;
}

void __49___ML3DatabaseConnectionSubPool_closeConnection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  _QWORD block[5];
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "close");

  v3 = MEMORY[0x1E0C809B0];
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(NSObject **)(v4 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49___ML3DatabaseConnectionSubPool_closeConnection___block_invoke_2;
  block[3] = &unk_1E5B65EB8;
  block[4] = v4;
  v14 = v5;
  dispatch_sync(v6, block);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connectionDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = v3;
    v11[1] = 3221225472;
    v11[2] = __49___ML3DatabaseConnectionSubPool_closeConnection___block_invoke_3;
    v11[3] = &unk_1E5B65D80;
    v12 = *(id *)(a1 + 32);
    dispatch_async(v10, v11);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 32));

}

uint64_t __49___ML3DatabaseConnectionSubPool_closeConnection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __49___ML3DatabaseConnectionSubPool_closeConnection___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectionDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectionDidClose:", v3);

}

void __64___ML3DatabaseConnectionSubPool_checkInConnection_returnToPool___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectionDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectionDidClose:", v3);

}

uint64_t __70___ML3DatabaseConnectionSubPool_isClosedWithNoActiveOrBusyConnections__block_invoke(uint64_t a1)
{
  uint64_t result;
  BOOL v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
  if (result)
  {
    v3 = 0;
  }
  else
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
    v3 = result == 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

intptr_t __40___ML3DatabaseConnectionSubPool_dealloc__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __79___ML3DatabaseConnectionSubPool_initWithDatabasePath_maxConcurrentConnections___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138543362;
      v4 = WeakRetained;
      _os_log_impl(&dword_1AC149000, v2, OS_LOG_TYPE_DEFAULT, "Database connection subpool %{public}@ received database deletion notification.", (uint8_t *)&v3, 0xCu);
    }

    objc_msgSend(WeakRetained, "_handleDatabaseDeletion");
  }

}

void __79___ML3DatabaseConnectionSubPool_initWithDatabasePath_maxConcurrentConnections___block_invoke_181(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    MSVHomeSharingCacheDirectory();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "containsString:", v3))
    {
      v4 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 138543362;
        v6 = WeakRetained;
        _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "Database connection subpool %{public}@ received HomeSharing caches cleared notification.", (uint8_t *)&v5, 0xCu);
      }

      objc_msgSend(WeakRetained, "_handleDatabaseDeletion");
    }

  }
}

@end
