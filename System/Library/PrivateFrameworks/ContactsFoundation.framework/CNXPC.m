@implementation CNXPC

+ (id)resumedConnectionForServiceName:(id)a3 remoteObjectInterfaceProtocol:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", v5);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v8);

    objc_msgSend(v7, "resume");
    v9 = v7;
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    +[CNXPC resumedConnectionForServiceName:remoteObjectInterfaceProtocol:].cold.1((uint64_t)v5);
  }

  return v7;
}

+ (id)listenerDelegateWithExportedObject:(id)a3 exportedInterfaceProtocol:(id)a4
{
  id v5;
  id v6;
  CNXPCListenerDelegate *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CNXPCListenerDelegate initWithWithExportedObject:exportedInterfaceProtocol:]([CNXPCListenerDelegate alloc], "initWithWithExportedObject:exportedInterfaceProtocol:", v6, v5);

  return v7;
}

+ (void)addAllowedClasses:(id)a3 toInterface:(id)a4 forSelector:(SEL)a5 argumentIndex:(unint64_t)a6 ofReply:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  void *v13;
  id v14;

  v7 = a7;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v11, "classesForSelector:argumentIndex:ofReply:", a5, a6, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setByAddingObjectsFromArray:", v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v14, a5, a6, v7);
}

+ (id)reasonConnectionWasInvalidated:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_6;
  objc_msgSend(v3, "_xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_6;
  objc_msgSend(v4, "_xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)xpc_connection_copy_invalidation_reason();

  if (!v7)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  free(v7);
  v9 = v8;
  LODWORD(v8) = CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v9);

  if ((_DWORD)v8)
  {

LABEL_6:
    v9 = CFSTR("<unknown>");
  }

  return v9;
}

+ (void)resumedConnectionForServiceName:(uint64_t)a1 remoteObjectInterfaceProtocol:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138543362;
  v2 = a1;
  _os_log_error_impl(&dword_18F80C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create XPC connection for service: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end
