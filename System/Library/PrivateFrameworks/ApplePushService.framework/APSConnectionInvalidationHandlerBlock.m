@implementation APSConnectionInvalidationHandlerBlock

void __APSConnectionInvalidationHandlerBlock_block_invoke(uint64_t a1, void *a2)
{
  _xpc_connection_s *v2;
  _QWORD *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[4];
  _QWORD *v7;
  _xpc_connection_s *v8;
  uint8_t buf[4];
  _QWORD *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  APSGetXPCConnectionContext(v2);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  +[APSLog connection](APSLog, "connection");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_19BBC2000, v4, OS_LOG_TYPE_DEFAULT, "invalidationHandler called for %@", buf, 0xCu);
  }

  if (v3)
  {
    v5 = v3[2];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __APSConnectionInvalidationHandlerBlock_block_invoke_56;
    v6[3] = &unk_1E3C8B590;
    v7 = v3;
    v8 = v2;
    dispatch_async(v5, v6);

  }
  else if (v2)
  {
    xpc_connection_cancel(v2);
  }

}

void __APSConnectionInvalidationHandlerBlock_block_invoke_56(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD block[4];
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_noteDisconnectedFromDaemonOnIvarQueue");
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[13];
  if (v3)
  {
    if (*(_QWORD *)(a1 + 40) == v3)
    {
      objc_msgSend(v2, "_cancelConnectionOnIvarQueue");
      objc_msgSend(*(id *)(a1 + 32), "_reconnectIfNecessaryOnIvarQueueAfterDelay");
    }
    else
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
    }
    +[APSLog connection](APSLog, "connection");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_19BBC2000, v4, OS_LOG_TYPE_DEFAULT, "%@ Couldn't find apsd - either something is very bad or the device is shutting down", buf, 0xCu);
    }
  }
  else
  {
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    +[APSLog connection](APSLog, "connection");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v13 = v7;
        _os_log_impl(&dword_19BBC2000, v5, OS_LOG_TYPE_DEFAULT, "%@ calling connectIfNecessary", buf, 0xCu);
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __APSConnectionInvalidationHandlerBlock_block_invoke_57;
      block[3] = &unk_1E3C8B240;
      v11 = *(id *)(a1 + 32);
      dispatch_async(v4, block);
      v5 = v11;
    }
    else if (v6)
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl(&dword_19BBC2000, v5, OS_LOG_TYPE_DEFAULT, "invalidationHandler had no queue for %@", buf, 0xCu);
    }

  }
}

void __APSConnectionInvalidationHandlerBlock_block_invoke_57(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1A1AC9000]();
  objc_msgSend(*(id *)(a1 + 32), "_connectIfNecessary");
  objc_autoreleasePoolPop(v2);
}

@end
