@implementation LiveFSMountClient

- (LiveFSMountClient)initWithProvider:(id)a3
{
  id v4;
  LiveFSMountClient *v5;
  uint64_t v6;
  NSXPCConnection *conn;
  void *v8;
  uint64_t v9;
  LiveFSMountClient *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LiveFSMountClient;
  v5 = -[LiveFSMountClient init](&v12, sel_init);
  if (v5)
  {
    connectionForServiceURL(CFSTR("machp://com.apple.filesystems.fskitd"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
    conn = v5->conn;
    v5->conn = (NSXPCConnection *)v6;

    if (!v5->conn)
    {
      v10 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255C02E58);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5->conn, "setRemoteObjectInterface:", v8);

    if (!v4
      || (-[LiveFSMountClient fixupConnectionFor:](v5, "fixupConnectionFor:", v4),
          v9 = objc_claimAutoreleasedReturnValue(),
          v5,
          (v5 = (LiveFSMountClient *)v9) != 0))
    {
      -[NSXPCConnection resume](v5->conn, "resume");
    }
  }
  v5 = v5;
  v10 = v5;
LABEL_8:

  return v10;
}

- (void)dealloc
{
  NSXPCConnection *conn;
  NSXPCConnection *v4;
  NSString *provider;
  LiveFSMounterClient *helper;
  objc_super v7;

  conn = self->conn;
  if (conn)
  {
    -[NSXPCConnection invalidate](conn, "invalidate");
    v4 = self->conn;
    self->conn = 0;

  }
  provider = self->provider;
  self->provider = 0;

  helper = self->helper;
  self->helper = 0;

  v7.receiver = self;
  v7.super_class = (Class)LiveFSMountClient;
  -[LiveFSMountClient dealloc](&v7, sel_dealloc);
}

+ (id)newClientForProvider:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProvider:", v4);

  return v5;
}

+ (id)newClient
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithProvider:", 0);
}

- (id)mounts:(id *)a3
{
  uint64_t v4;
  NSXPCConnection *conn;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v4 = MEMORY[0x24BDAC760];
  conn = self->conn;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __28__LiveFSMountClient_mounts___block_invoke;
  v10[3] = &unk_24F64BF38;
  v10[4] = &v11;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __28__LiveFSMountClient_mounts___block_invoke_2;
  v9[3] = &unk_24F64BF60;
  v9[4] = &v17;
  objc_msgSend(v6, "listMounts:reply:", 0, v9);
  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __28__LiveFSMountClient_mounts___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __28__LiveFSMountClient_mounts___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)allMounts:(id *)a3
{
  uint64_t v4;
  NSXPCConnection *conn;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v4 = MEMORY[0x24BDAC760];
  conn = self->conn;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __31__LiveFSMountClient_allMounts___block_invoke;
  v10[3] = &unk_24F64BF38;
  v10[4] = &v11;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __31__LiveFSMountClient_allMounts___block_invoke_2;
  v9[3] = &unk_24F64BF60;
  v9[4] = &v17;
  objc_msgSend(v6, "listMounts:reply:", 1, v9);
  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __31__LiveFSMountClient_allMounts___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __31__LiveFSMountClient_allMounts___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)mountVolume:(id)a3 displayName:(id)a4 provider:(id)a5 domainError:(id)a6 on:(id)a7 how:(unint64_t)a8 options:(id)a9
{
  return -[LiveFSMountClient mountVolume:fileSystem:displayName:provider:domainError:on:how:options:](self, "mountVolume:fileSystem:displayName:provider:domainError:on:how:options:", a3, 0, a4, a5, a6, a7, a8, a9);
}

- (id)mountVolume:(id)a3 fileSystem:(id)a4 displayName:(id)a5 provider:(id)a6 domainError:(id)a7 on:(id)a8 how:(int)a9
{
  return -[LiveFSMountClient mountVolume:fileSystem:displayName:provider:domainError:on:how:options:](self, "mountVolume:fileSystem:displayName:provider:domainError:on:how:options:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (id)mountVolume:(id)a3 fileSystem:(id)a4 displayName:(id)a5 provider:(id)a6 domainError:(id)a7 on:(id)a8 how:(unint64_t)a9 options:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  NSXPCConnection *conn;
  void *v25;
  id v26;
  uint64_t v28;
  id v29;
  id v30;
  _QWORD v31[5];
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v30 = a3;
  v29 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a10;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = 0;
  v21 = v19;
  v22 = v21;
  if (!v21)
  {
    if (objc_msgSend(CFSTR("com.apple.filesystems.UserFS.FileProvider"), "isEqualToString:", v17))
    {
      objc_msgSend(CFSTR("com.apple.filesystems.userfsd"), "stringByAppendingPathComponent:", v30);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
  }
  v23 = MEMORY[0x24BDAC760];
  conn = self->conn;
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __92__LiveFSMountClient_mountVolume_fileSystem_displayName_provider_domainError_on_how_options___block_invoke;
  v32[3] = &unk_24F64BF38;
  v32[4] = &v33;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v32);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v23;
  v31[1] = 3221225472;
  v31[2] = __92__LiveFSMountClient_mountVolume_fileSystem_displayName_provider_domainError_on_how_options___block_invoke_2;
  v31[3] = &unk_24F64BF38;
  v31[4] = &v33;
  LODWORD(v28) = a9;
  objc_msgSend(v25, "mountVolume:fileSystem:displayName:provider:domainError:on:how:options:reply:", v30, v29, v16, v17, v18, v22, v28, v20, v31);
  v26 = (id)v34[5];

  _Block_object_dispose(&v33, 8);
  return v26;
}

void __92__LiveFSMountClient_mountVolume_fileSystem_displayName_provider_domainError_on_how_options___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __92__LiveFSMountClient_mountVolume_fileSystem_displayName_provider_domainError_on_how_options___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)mountVolume:(id)a3 fileSystem:(id)a4 displayName:(id)a5 provider:(id)a6 domainError:(id)a7 on:(id)a8 how:(unint64_t)a9 options:(id)a10 auditToken:(id *)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  NSXPCConnection *conn;
  void *v25;
  __int128 v26;
  id v27;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[5];
  _OWORD v34[2];
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v32 = a3;
  v31 = a4;
  v30 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a10;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy_;
  v40 = __Block_byref_object_dispose_;
  v41 = 0;
  v21 = v19;
  v22 = v21;
  if (!v21)
  {
    if (objc_msgSend(CFSTR("com.apple.filesystems.UserFS.FileProvider"), "isEqualToString:", v17))
    {
      objc_msgSend(CFSTR("com.apple.filesystems.userfsd"), "stringByAppendingPathComponent:", v32);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
  }
  v23 = MEMORY[0x24BDAC760];
  conn = self->conn;
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __103__LiveFSMountClient_mountVolume_fileSystem_displayName_provider_domainError_on_how_options_auditToken___block_invoke;
  v35[3] = &unk_24F64BF38;
  v35[4] = &v36;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v35);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *(_OWORD *)&a11->var0[4];
  v34[0] = *(_OWORD *)a11->var0;
  v34[1] = v26;
  v33[0] = v23;
  v33[1] = 3221225472;
  v33[2] = __103__LiveFSMountClient_mountVolume_fileSystem_displayName_provider_domainError_on_how_options_auditToken___block_invoke_2;
  v33[3] = &unk_24F64BF38;
  v33[4] = &v36;
  LODWORD(v29) = a9;
  objc_msgSend(v25, "mountVolume:fileSystem:displayName:provider:domainError:on:how:options:auditToken:reply:", v32, v31, v30, v17, v18, v22, v29, v20, v34, v33);
  v27 = (id)v37[5];

  _Block_object_dispose(&v36, 8);
  return v27;
}

void __103__LiveFSMountClient_mountVolume_fileSystem_displayName_provider_domainError_on_how_options_auditToken___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __103__LiveFSMountClient_mountVolume_fileSystem_displayName_provider_domainError_on_how_options_auditToken___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)mountVolume:(id)a3 displayName:(id)a4 provider:(id)a5 domainError:(id)a6 on:(id)a7 how:(int)a8
{
  return -[LiveFSMountClient mountVolume:displayName:provider:domainError:on:how:options:](self, "mountVolume:displayName:provider:domainError:on:how:options:", a3, a4, a5, a6, a7, a8, 0);
}

- (id)mountVolume:(id)a3 displayName:(id)a4 provider:(id)a5 on:(id)a6 how:(int)a7
{
  return -[LiveFSMountClient mountVolume:displayName:provider:domainError:on:how:](self, "mountVolume:displayName:provider:domainError:on:how:", a3, a4, a5, 0, a6, *(_QWORD *)&a7);
}

- (id)mountVolume:(id)a3 provider:(id)a4 on:(id)a5 how:(int)a6
{
  return -[LiveFSMountClient mountVolume:displayName:provider:domainError:on:how:](self, "mountVolume:displayName:provider:domainError:on:how:", a3, a3, a4, 0, a5, *(_QWORD *)&a6);
}

- (id)unmountVolume:(id)a3 how:(int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  NSXPCConnection *conn;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v4 = *(_QWORD *)&a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy_;
  v16[4] = __Block_byref_object_dispose_;
  v17 = 0;
  v7 = MEMORY[0x24BDAC760];
  conn = self->conn;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __39__LiveFSMountClient_unmountVolume_how___block_invoke;
  v15[3] = &unk_24F64BF38;
  v15[4] = &v18;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __39__LiveFSMountClient_unmountVolume_how___block_invoke_65;
  v14[3] = &unk_24F64BF88;
  v14[4] = &v18;
  v14[5] = v16;
  objc_msgSend(v9, "unmountVolume:how:reply:", v6, v4, v14);
  livefs_std_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = v19[5];
    *(_DWORD *)buf = 138412290;
    v25 = v11;
    _os_log_impl(&dword_22BD61000, v10, OS_LOG_TYPE_INFO, "returning error %@", buf, 0xCu);
  }

  v12 = (id)v19[5];
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __39__LiveFSMountClient_unmountVolume_how___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  livefs_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __39__LiveFSMountClient_unmountVolume_how___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v3;

}

void __39__LiveFSMountClient_unmountVolume_how___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  livefs_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __39__LiveFSMountClient_unmountVolume_how___block_invoke_65_cold_1();

}

- (id)unmountVolumeByID:(unsigned int)a3 how:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSXPCConnection *conn;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy_;
  v15[4] = __Block_byref_object_dispose_;
  v16 = 0;
  v6 = MEMORY[0x24BDAC760];
  conn = self->conn;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __43__LiveFSMountClient_unmountVolumeByID_how___block_invoke;
  v14[3] = &unk_24F64BF38;
  v14[4] = &v17;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __43__LiveFSMountClient_unmountVolumeByID_how___block_invoke_67;
  v13[3] = &unk_24F64BF88;
  v13[4] = &v17;
  v13[5] = v15;
  objc_msgSend(v8, "unmountVolumeByID:how:reply:", v5, v4, v13);
  livefs_std_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = v18[5];
    *(_DWORD *)buf = 138412290;
    v24 = v10;
    _os_log_impl(&dword_22BD61000, v9, OS_LOG_TYPE_INFO, "returning error %@", buf, 0xCu);
  }

  v11 = (id)v18[5];
  _Block_object_dispose(v15, 8);

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __43__LiveFSMountClient_unmountVolumeByID_how___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  livefs_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __39__LiveFSMountClient_unmountVolume_how___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v3;

}

void __43__LiveFSMountClient_unmountVolumeByID_how___block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  livefs_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __39__LiveFSMountClient_unmountVolume_how___block_invoke_65_cold_1();

}

- (void)unmountVolumeNamed:(id)a3 providerName:(id)a4 domainError:(id)a5 how:(int)a6 reply:(id)a7
{
  uint64_t v7;
  id v12;
  NSXPCConnection *conn;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v7 = *(_QWORD *)&a6;
  v12 = a7;
  conn = self->conn;
  v14 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __75__LiveFSMountClient_unmountVolumeNamed_providerName_domainError_how_reply___block_invoke;
  v23[3] = &unk_24F64BFB0;
  v15 = v12;
  v24 = v15;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __75__LiveFSMountClient_unmountVolumeNamed_providerName_domainError_how_reply___block_invoke_68;
  v21[3] = &unk_24F64BFD8;
  v22 = v15;
  v20 = v15;
  objc_msgSend(v19, "unmountVolume:provider:how:domainError:reply:", v18, v17, v7, v16, v21);

}

void __75__LiveFSMountClient_unmountVolumeNamed_providerName_domainError_how_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  livefs_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __75__LiveFSMountClient_unmountVolumeNamed_providerName_domainError_how_reply___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__LiveFSMountClient_unmountVolumeNamed_providerName_domainError_how_reply___block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int)verboseLevelOrError:(id *)a3
{
  uint64_t v4;
  NSXPCConnection *conn;
  void *v6;
  void *v7;
  int v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v4 = MEMORY[0x24BDAC760];
  conn = self->conn;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __41__LiveFSMountClient_verboseLevelOrError___block_invoke;
  v11[3] = &unk_24F64BF38;
  v11[4] = &v16;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __41__LiveFSMountClient_verboseLevelOrError___block_invoke_2;
  v10[3] = &unk_24F64C000;
  v10[4] = &v12;
  objc_msgSend(v6, "verboseLevel:", v10);
  v7 = (void *)v17[5];
  if (v7)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v7);
    v8 = -1;
  }
  else
  {
    if (a3)
      *a3 = 0;
    v8 = *((_DWORD *)v13 + 6);
  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v8;
}

void __41__LiveFSMountClient_verboseLevelOrError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __41__LiveFSMountClient_verboseLevelOrError___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)setVerboseLevel:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  NSXPCConnection *conn;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = *(_QWORD *)&a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v4 = MEMORY[0x24BDAC760];
  conn = self->conn;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __37__LiveFSMountClient_setVerboseLevel___block_invoke;
  v10[3] = &unk_24F64BF38;
  v10[4] = &v11;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __37__LiveFSMountClient_setVerboseLevel___block_invoke_2;
  v9[3] = &unk_24F64BF38;
  v9[4] = &v11;
  objc_msgSend(v6, "setVerboseLevel:reply:", v3, v9);
  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __37__LiveFSMountClient_setVerboseLevel___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __37__LiveFSMountClient_setVerboseLevel___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)updateErrorStateForVolume:(id)a3 provider:(id)a4 domainError:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSXPCConnection *conn;
  void *v13;
  id v14;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v11 = MEMORY[0x24BDAC760];
  conn = self->conn;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __68__LiveFSMountClient_updateErrorStateForVolume_provider_domainError___block_invoke;
  v17[3] = &unk_24F64BF38;
  v17[4] = &v18;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __68__LiveFSMountClient_updateErrorStateForVolume_provider_domainError___block_invoke_2;
  v16[3] = &unk_24F64BF38;
  v16[4] = &v18;
  objc_msgSend(v13, "updateErrorStateForVolume:provider:domainError:reply:", v8, v9, v10, v16);
  v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v14;
}

void __68__LiveFSMountClient_updateErrorStateForVolume_provider_domainError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __68__LiveFSMountClient_updateErrorStateForVolume_provider_domainError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->helper, 0);
  objc_storeStrong((id *)&self->provider, 0);
  objc_storeStrong((id *)&self->conn, 0);
}

void __39__LiveFSMountClient_unmountVolume_how___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22BD61000, a2, a3, "Encountered error on sync connection to the mounter: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __39__LiveFSMountClient_unmountVolume_how___block_invoke_65_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22BD61000, v0, v1, "mounter returned error %@ for name %@");
  OUTLINED_FUNCTION_2();
}

void __75__LiveFSMountClient_unmountVolumeNamed_providerName_domainError_how_reply___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22BD61000, a2, a3, "Encountered error on connection to the mounter: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
