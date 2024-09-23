@implementation CCAdminConnection

- (CCAdminConnection)initWithConnection:(id)a3 writeAccess:(id)a4 accessAssertion:(id)a5
{
  id v9;
  id v10;
  id v11;
  CCAdminConnection *v12;
  CCAdminConnection *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CCAdminConnection;
  v12 = -[CCAdminConnection init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    objc_storeStrong((id *)&v13->_writeAccess, a4);
    objc_storeStrong((id *)&v13->_accessAssertion, a5);
  }

  return v13;
}

- (id)_shouldDeferActivityBlock
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__CCAdminConnection__shouldDeferActivityBlock__block_invoke_1;
  v6[3] = &unk_25098AD30;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x23B8203DC](v6);

  return v4;
}

void __46__CCAdminConnection__shouldDeferActivityBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __biome_log_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __46__CCAdminConnection__shouldDeferActivityBlock__block_invoke_cold_1((uint64_t)v2, v3);

}

BOOL __46__CCAdminConnection__shouldDeferActivityBlock__block_invoke_1(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _BOOL8 v3;
  uint8_t v5[8];
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v1 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__CCAdminConnection__shouldDeferActivityBlock__block_invoke_2;
  v6[3] = &unk_25098AD08;
  v6[4] = &v7;
  objc_msgSend(v1, "shouldDeferCurrentActivity:", v6);
  if (*((_BYTE *)v8 + 24))
  {
    __biome_log_for_category();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_237B02000, v2, OS_LOG_TYPE_DEFAULT, "Admin client has signaled to defer current activity", v5, 2u);
    }

    v3 = *((_BYTE *)v8 + 24) != 0;
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __46__CCAdminConnection__shouldDeferActivityBlock__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)startMaintenanceActivity:(id)a3
{
  CCDataResourceWriteAccess *writeAccess;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  writeAccess = self->_writeAccess;
  -[CCAdminConnection _shouldDeferActivityBlock](self, "_shouldDeferActivityBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CCDataResourceWriteAccess performMaintenanceActivity:accessAssertion:](writeAccess, "performMaintenanceActivity:accessAssertion:", v5, self->_accessAssertion);

  v7 = v9;
  if (v9)
  {
    if (v6)
      v8 = 1;
    else
      v8 = 2;
    (*((void (**)(id, uint64_t))v9 + 2))(v9, v8);
    v7 = v9;
  }

}

- (void)removeSetsRootDirectory:(id)a3
{
  void (**v3)(id, uint64_t);
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, uint64_t))a3;
  CCSetsRootDirectoryURL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v7 = objc_msgSend(v5, "removeItemAtPath:error:", v6, &v12);
  v8 = v12;

  __biome_log_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("NO");
    if (v7)
      v10 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v14 = v4;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_237B02000, v9, OS_LOG_TYPE_DEFAULT, "Removed sets root directory URL: %@ success: %@", buf, 0x16u);
  }

  if (v3)
  {
    if (v7)
      v11 = 1;
    else
      v11 = 2;
    v3[2](v3, v11);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessAssertion, 0);
  objc_storeStrong((id *)&self->_writeAccess, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __46__CCAdminConnection__shouldDeferActivityBlock__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_237B02000, a2, OS_LOG_TYPE_ERROR, "Failed to check admin client for activity deferral: %@", (uint8_t *)&v2, 0xCu);
}

@end
