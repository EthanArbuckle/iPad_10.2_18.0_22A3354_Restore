@implementation CCSetStoreUpdateServiceExported

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adminService, 0);
  objc_storeStrong((id *)&self->_donateConnection, 0);
  objc_storeStrong((id *)&self->_donateConnectionFactory, 0);
  objc_storeStrong((id *)&self->_writeAccess, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

- (void)beginSetDonationWithItemType:(unsigned __int16)a3 fromDevice:(id)a4 encodedDescriptors:(id)a5 version:(unint64_t)a6 validity:(id)a7 completion:(id)a8
{
  uint64_t v12;
  id v14;
  id v15;
  void (**v16)(id, uint64_t, _QWORD);
  id v17;

  v12 = a3;
  v17 = a4;
  v14 = a5;
  v15 = a7;
  v16 = (void (**)(id, uint64_t, _QWORD))a8;
  if (-[CCSetStoreUpdateServiceExported setupDonateConnectionForSetWithItemType:encodedDescriptors:](self, "setupDonateConnectionForSetWithItemType:encodedDescriptors:", v12, v14))
  {
    -[CCDonateConnection beginSetDonationWithItemType:fromDevice:encodedDescriptors:version:validity:completion:](self->_donateConnection, "beginSetDonationWithItemType:fromDevice:encodedDescriptors:version:validity:completion:", v12, v17, v14, a6, v15, v16);
  }
  else
  {
    v16[2](v16, 5, 0);
  }

}

- (BOOL)setupDonateConnectionForSetWithItemType:(unsigned __int16)a3 encodedDescriptors:(id)a4
{
  BOOL v4;
  uint64_t v5;
  void *v7;
  BMProcess *process;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  BOOL v24;
  CCDonateConnection *v25;
  NSObject *p_super;
  id v28;
  id v29;

  if (!self->_donateConnection)
  {
    v5 = a3;
    v7 = (void *)MEMORY[0x24BE0C080];
    process = self->_process;
    v9 = a4;
    -[CCSetStoreUpdateServiceExported useCase](self, "useCase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "policyForProcess:connectionFlags:useCase:", process, 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE156D8]), "initWithItemType:encodedDescriptors:error:", v5, v9, &v29);

    v13 = v29;
    if (v12)
      v14 = v13 == 0;
    else
      v14 = 0;
    if (!v14)
    {
      v15 = v13;
      __biome_log_for_category();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[CCSetStoreUpdateServiceExported setupDonateConnectionForSetWithItemType:encodedDescriptors:].cold.1((uint64_t)v15, v16);
      v4 = 0;
      goto LABEL_29;
    }
    CCTypeIdentifierRegistryBridge();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIdentifierForItemType:", v5);
    v16 = objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if ((objc_msgSend(v11, "allowsAccessToSetStoreUpdateServiceForSet:", v16) & 1) != 0)
      {
        v18 = objc_alloc(MEMORY[0x24BE0C0B0]);
        objc_msgSend(v12, "descriptors");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "initWithType:name:descriptors:", 4, v16, v19);

        v21 = objc_alloc(MEMORY[0x24BE0C070]);
        v22 = (void *)objc_msgSend(v21, "initWithUseCase:", *MEMORY[0x24BE0C068]);
        v28 = 0;
        objc_msgSend(v22, "requestAccessToResource:mode:error:", v20, 3, &v28);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v28;
        if (v15)
          v24 = 1;
        else
          v24 = v23 == 0;
        v4 = !v24;
        if (v24)
        {
          __biome_log_for_category();
          p_super = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
            -[CCSetStoreUpdateServiceExported setupDonateConnectionForSetWithItemType:encodedDescriptors:].cold.3((uint64_t)v20);
        }
        else
        {
          -[CCDonateConnectionFactory makeXPCConnection:accessAssertion:](self->_donateConnectionFactory, "makeXPCConnection:accessAssertion:", self->_connection, v23);
          v25 = (CCDonateConnection *)objc_claimAutoreleasedReturnValue();
          p_super = &self->_donateConnection->super;
          self->_donateConnection = v25;
        }

        goto LABEL_28;
      }
      __biome_log_for_category();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[CCSetStoreUpdateServiceExported setupDonateConnectionForSetWithItemType:encodedDescriptors:].cold.4(v11, (uint64_t)v16, v20);
    }
    else
    {
      __biome_log_for_category();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[CCSetStoreUpdateServiceExported setupDonateConnectionForSetWithItemType:encodedDescriptors:].cold.2(v11);
    }
    v15 = 0;
    v4 = 0;
LABEL_28:

LABEL_29:
    return v4;
  }
  return 1;
}

- (void)addItemsWithContents:(id)a3 metaContents:(id)a4 completion:(id)a5
{
  -[CCDonateConnection addItemsWithContents:metaContents:completion:](self->_donateConnection, "addItemsWithContents:metaContents:completion:", a3, a4, a5);
}

- (CCSetStoreUpdateServiceExported)initWithQueue:(id)a3 process:(id)a4 connection:(id)a5 writeAccess:(id)a6 donateConnectionFactory:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CCSetStoreUpdateServiceExported *v17;
  CCSetStoreUpdateServiceExported *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CCSetStoreUpdateServiceExported;
  v17 = -[CCSetStoreUpdateServiceExported init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_process, a4);
    objc_storeStrong((id *)&v18->_writeAccess, a6);
    objc_storeStrong((id *)&v18->_donateConnectionFactory, a7);
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeStrong((id *)&v18->_connection, a5);
  }

  return v18;
}

- (id)useCase
{
  void *v3;
  void *v4;
  NSString *v5;
  uint64_t *p_useCase;
  NSString *useCase;
  NSObject *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bm_remoteUseCase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  useCase = self->_useCase;
  p_useCase = (uint64_t *)&self->_useCase;
  v5 = useCase;
  if (useCase)
  {
    if (v4 && (-[NSString isEqual:](v5, "isEqual:", v4) & 1) == 0)
    {
      __biome_log_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[CCSetStoreUpdateServiceExported useCase].cold.1(p_useCase);

    }
    v9 = (void *)*p_useCase;
  }
  else
  {
    objc_storeStrong((id *)p_useCase, v4);
    v9 = v4;
  }
  v10 = v9;

  return v10;
}

- (void)abortSetDonation
{
  -[CCDonateConnection abortSetDonation](self->_donateConnection, "abortSetDonation");
}

- (void)endSetDonationWithOptions:(unint64_t)a3 completion:(id)a4
{
  -[CCDonateConnection endSetDonationWithOptions:completion:](self->_donateConnection, "endSetDonationWithOptions:completion:", a3, a4);
}

- (void)removeSourceItemIdentifier:(id)a3 completion:(id)a4
{
  -[CCDonateConnection removeSourceItemIdentifier:completion:](self->_donateConnection, "removeSourceItemIdentifier:completion:", a3, a4);
}

- (void)mergeDelta:(id)a3 withDeltaMetadata:(id)a4 completion:(id)a5
{
  -[CCDonateConnection mergeDelta:withDeltaMetadata:completion:](self->_donateConnection, "mergeDelta:withDeltaMetadata:completion:", a3, a4, a5);
}

- (BOOL)_setupAdminService
{
  BOOL v2;
  void *v4;
  BMProcess *process;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  CCAdminConnection *v15;
  NSObject *p_super;
  id v18;

  if (self->_adminService)
    return 1;
  v4 = (void *)MEMORY[0x24BE0C080];
  process = self->_process;
  -[CCSetStoreUpdateServiceExported useCase](self, "useCase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "policyForProcess:connectionFlags:useCase:", process, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "allowsAccessToSetsWithMode:", 3) & 1) != 0)
  {
    v8 = objc_alloc(MEMORY[0x24BE0C0B0]);
    v9 = objc_msgSend(v8, "initWithType:name:", 5, *MEMORY[0x24BE0C030]);
    v10 = objc_alloc(MEMORY[0x24BE0C070]);
    v11 = (void *)objc_msgSend(v10, "initWithUseCase:", *MEMORY[0x24BE0C068]);
    v18 = 0;
    objc_msgSend(v11, "requestAccessToResource:mode:error:", v9, 3, &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;
    if (v13)
      v14 = 1;
    else
      v14 = v12 == 0;
    v2 = !v14;
    if (v14)
    {
      __biome_log_for_category();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        -[CCSetStoreUpdateServiceExported setupDonateConnectionForSetWithItemType:encodedDescriptors:].cold.3((uint64_t)v9);
    }
    else
    {
      v15 = -[CCAdminConnection initWithConnection:writeAccess:accessAssertion:]([CCAdminConnection alloc], "initWithConnection:writeAccess:accessAssertion:", self->_connection, self->_writeAccess, v12);
      p_super = &self->_adminService->super;
      self->_adminService = v15;
    }

  }
  else
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CCSetStoreUpdateServiceExported _setupAdminService].cold.2(v9);
    v2 = 0;
  }

  return v2;
}

- (void)startMaintenanceActivity:(id)a3
{
  void (**v4)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (-[CCSetStoreUpdateServiceExported _setupAdminService](self, "_setupAdminService"))
    -[CCAdminConnection startMaintenanceActivity:](self->_adminService, "startMaintenanceActivity:", v4);
  else
    v4[2](v4, 2);

}

- (void)removeSetsRootDirectory:(id)a3
{
  void (**v4)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (-[CCSetStoreUpdateServiceExported _setupAdminService](self, "_setupAdminService"))
    -[CCAdminConnection removeSetsRootDirectory:](self->_adminService, "removeSetsRootDirectory:", v4);
  else
    v4[2](v4, 2);

}

- (void)useCase
{
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_237B02000, v2, OS_LOG_TYPE_FAULT, "CCSetDonationServerExported - Ignoring use-case change from %@ to %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_8();
}

- (void)setupDonateConnectionForSetWithItemType:(uint64_t)a1 encodedDescriptors:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_237B02000, a2, OS_LOG_TYPE_ERROR, "CCSetDonationServerExported could not initialize CCSet with error: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_8();
}

- (void)setupDonateConnectionForSetWithItemType:(void *)a1 encodedDescriptors:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "descriptionOfProcessAndUseCase");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1(&dword_237B02000, v2, v3, "CCSetDonationServerExported - %@ could not resolve set identifier for item type %hu'", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)setupDonateConnectionForSetWithItemType:(uint64_t)a1 encodedDescriptors:.cold.3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_237B02000, v1, v2, "Could not resolve access assertion for specifier: %@, error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_8();
}

- (void)setupDonateConnectionForSetWithItemType:(NSObject *)a3 encodedDescriptors:.cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "descriptionOfProcessAndUseCase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_237B02000, a3, OS_LOG_TYPE_ERROR, "CCSetDonationServerExported - %@ is not entitled to access the set store update service for'%@'", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_1_0();
}

- (void)_setupAdminService
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_237B02000, log, OS_LOG_TYPE_ERROR, "Cannot setup admin service, process not properly entitled to access the sets directory", v1, 2u);
}

@end
