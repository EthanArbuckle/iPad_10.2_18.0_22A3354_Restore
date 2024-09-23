@implementation CTCellularPlanProvisioning

- (CTCellularPlanProvisioning)init
{
  CTCellularPlanProvisioning *v2;
  CoreTelephonyClient *v3;
  uint64_t v4;
  CoreTelephonyClient *client;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CTCellularPlanProvisioning;
  v2 = -[CTCellularPlanProvisioning init](&v7, sel_init);
  if (v2)
  {
    v3 = [CoreTelephonyClient alloc];
    v4 = -[CoreTelephonyClient initWithQueue:](v3, "initWithQueue:", MEMORY[0x1E0C80D38]);
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v4;

    v2->_supportsEmbeddedSIM = -[CoreTelephonyClient supportsEmbeddedSIM](v2->_client, "supportsEmbeddedSIM");
  }
  return v2;
}

- (BOOL)supportsCellularPlan
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SmdpUrl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "infoDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("IccidPrefix"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "infoDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("CarrierDescriptors"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v11, "count") < 0x10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v22 = 138412802;
      v23 = v5;
      v24 = 2112;
      v25 = v8;
      v26 = 2048;
      v27 = objc_msgSend(v11, "count");
      _os_log_impl(&dword_18425C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "SMDP Url: %@, Iccid Prefix: %@, Carrier Descriptors count: %lu", (uint8_t *)&v22, 0x20u);
    }
    v20 = -[CoreTelephonyClient supportsPlanProvisioning:carrierDescriptors:smdpUrl:iccidPrefix:](self->_client, "supportsPlanProvisioning:carrierDescriptors:smdpUrl:iccidPrefix:", 0, v11, v5, v8);
  }
  else
  {
    v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v12)
      -[CTCellularPlanProvisioning supportsCellularPlan].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    v20 = 0;
  }

  return v20;
}

- (void)addPlanWith:(CTCellularPlanProvisioningRequest *)request completionHandler:(void *)completionHandler
{
  CTCellularPlanProvisioningRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CoreTelephonyClient *client;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;

  v6 = request;
  v7 = completionHandler;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "infoDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("CFBundleDisplayName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    goto LABEL_3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "infoDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("CFBundleName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
LABEL_3:
    client = self->_client;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __60__CTCellularPlanProvisioning_addPlanWith_completionHandler___block_invoke;
    v22[3] = &unk_1E152FB28;
    v23 = v7;
    -[CoreTelephonyClient addPlanWith:appName:appType:completionHandler:](client, "addPlanWith:appName:appType:completionHandler:", v6, v10, 0, v22);

  }
  else
  {
    v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v14)
      -[CTCellularPlanProvisioning addPlanWith:completionHandler:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    (*((void (**)(void *, uint64_t))v7 + 2))(v7, 1);
  }

}

uint64_t __60__CTCellularPlanProvisioning_addPlanWith_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)supportsEmbeddedSIM
{
  return self->_supportsEmbeddedSIM;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)supportsCellularPlan
{
  OUTLINED_FUNCTION_0(&dword_18425C000, MEMORY[0x1E0C81028], a3, "Carrier Descriptors Array size more than allowed limit (15)", a5, a6, a7, a8, 0);
}

- (void)addPlanWith:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18425C000, MEMORY[0x1E0C81028], a3, "App Name is not available - Check keys CFBundleDisplayName or CFBundleName are set", a5, a6, a7, a8, 0);
}

@end
