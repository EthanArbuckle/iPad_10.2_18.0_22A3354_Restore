@implementation GCIPCRemoteProcess

void __37___GCIPCRemoteProcess_addConnection___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 48);
  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  objc_msgSend(*(id *)(a1 + 32), "connectionInvalidationRegistrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v3);

  if ((v6 & 1) == 0)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("GCIPCProcess.m"), 97, CFSTR("Bug in %s"), "-[_GCIPCRemoteProcess addConnection:]_block_invoke");

  }
  objc_msgSend(*(id *)(a1 + 32), "connectionInvalidationRegistrations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v3);

  objc_msgSend(*(id *)(a1 + 32), "connections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if ((objc_msgSend(v9, "containsObject:", v2) & 1) == 0)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("GCIPCProcess.m"), 101, CFSTR("Bug in %s"), "-[_GCIPCRemoteProcess addConnection:]_block_invoke");

  }
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v15 = v13;
      v16 = 2112;
      v17 = v2;
      _os_log_impl(&dword_215181000, v12, OS_LOG_TYPE_INFO, "%@ removing connection: %@", buf, 0x16u);
    }

  }
  objc_msgSend(v9, "removeObject:", v2);
  objc_msgSend(*(id *)(a1 + 32), "setConnections:", v9);

  objc_sync_exit(v4);
}

@end
