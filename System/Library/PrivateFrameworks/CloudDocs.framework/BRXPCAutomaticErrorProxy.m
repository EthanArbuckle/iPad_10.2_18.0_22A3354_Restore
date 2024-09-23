@implementation BRXPCAutomaticErrorProxy

- (BRXPCAutomaticErrorProxy)initWithConnection:(id)a3 service:(id)a4 interface:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BRXPCAutomaticErrorProxy *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "setRemoteObjectInterface:", v11);
  objc_msgSend(v11, "protocol");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingString:", CFSTR(" error proxy"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = getpid();
  v18.receiver = self;
  v18.super_class = (Class)BRXPCAutomaticErrorProxy;
  v16 = -[FPXPCAutomaticErrorProxy initWithConnection:protocol:orError:name:requestPid:](&v18, sel_initWithConnection_protocol_orError_name_requestPid_, v9, v12, 0, v14, v15);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_connection, a3);
    objc_storeStrong((id *)&v16->_service, a4);
    +[BRXPCAutomaticErrorProxy incrementConnectionRefCount:](BRXPCAutomaticErrorProxy, "incrementConnectionRefCount:", v16->_connection);
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRXPCAutomaticErrorProxy;
  v4 = -[FPXPCAutomaticErrorProxy copyWithZone:](&v7, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 13, self->_service);
  objc_storeStrong(v4 + 12, self->_connection);
  v5 = (id)__connectionToReferenceCount;
  objc_sync_enter(v5);
  +[BRXPCAutomaticErrorProxy incrementConnectionRefCount:](BRXPCAutomaticErrorProxy, "incrementConnectionRefCount:", self->_connection);
  objc_sync_exit(v5);

  return v4;
}

- (void)invalidate
{
  NSXPCConnection *connection;
  id obj;

  obj = (id)__connectionToReferenceCount;
  objc_sync_enter(obj);
  +[BRXPCAutomaticErrorProxy decrementConnectionRefCount:](BRXPCAutomaticErrorProxy, "decrementConnectionRefCount:", self->_connection);
  connection = self->_connection;
  self->_connection = 0;

  objc_sync_exit(obj);
}

- (void)dealloc
{
  objc_super v3;

  -[BRXPCAutomaticErrorProxy invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BRXPCAutomaticErrorProxy;
  -[BRXPCAutomaticErrorProxy dealloc](&v3, sel_dealloc);
}

+ (BOOL)sanitizeErrors
{
  return 0;
}

+ (void)incrementConnectionRefCount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    if (incrementConnectionRefCount__onceToken != -1)
      dispatch_once(&incrementConnectionRefCount__onceToken, &__block_literal_global_33);
    v3 = (id)__connectionToReferenceCount;
    objc_sync_enter(v3);
    objc_msgSend((id)__connectionToReferenceCount, "objectForKey:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = (void *)__connectionToReferenceCount;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "longLongValue") + 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v7, v8);

    }
    else
    {
      objc_msgSend((id)__connectionToReferenceCount, "setObject:forKey:", &unk_1E3DC2B28, v8);
    }

    objc_sync_exit(v3);
  }

}

void __56__BRXPCAutomaticErrorProxy_incrementConnectionRefCount___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__connectionToReferenceCount;
  __connectionToReferenceCount = v0;

}

+ (void)decrementConnectionRefCount:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v3 = a3;
  if (v3)
  {
    v4 = (id)__connectionToReferenceCount;
    objc_sync_enter(v4);
    objc_msgSend((id)__connectionToReferenceCount, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "longLongValue");
    v7 = v6 - 1;
    if (v6 > 1)
    {
      v8 = (void *)__connectionToReferenceCount;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v9, v3);

    }
    else
    {
      if (v6 != 1)
      {
        brc_bread_crumbs((uint64_t)"+[BRXPCAutomaticErrorProxy decrementConnectionRefCount:]", 103);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          +[BRXPCAutomaticErrorProxy decrementConnectionRefCount:].cold.1((uint64_t)v10, v11);

      }
      objc_msgSend(v3, "invalidate", v7);
      objc_msgSend((id)__connectionToReferenceCount, "removeObjectForKey:", v3);
    }

    objc_sync_exit(v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

+ (void)decrementConnectionRefCount:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_19CBF0000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: count == 1%@", (uint8_t *)&v2, 0xCu);
}

@end
