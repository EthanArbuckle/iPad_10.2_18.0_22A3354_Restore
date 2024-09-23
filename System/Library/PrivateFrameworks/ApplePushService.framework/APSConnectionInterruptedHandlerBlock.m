@implementation APSConnectionInterruptedHandlerBlock

void __APSConnectionInterruptedHandlerBlock_block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_19BBC2000, v4, OS_LOG_TYPE_DEFAULT, "interruptedHandler called for %@", buf, 0xCu);
  }

  if (v3)
  {
    v5 = v3[2];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __APSConnectionInterruptedHandlerBlock_block_invoke_54;
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

void __APSConnectionInterruptedHandlerBlock_block_invoke_54(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

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
  }
}

@end
