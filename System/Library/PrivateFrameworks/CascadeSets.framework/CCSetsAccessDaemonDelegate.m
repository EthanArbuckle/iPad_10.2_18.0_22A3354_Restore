@implementation CCSetsAccessDaemonDelegate

- (CCSetsAccessDaemonDelegate)initWithDataSiteManager:(id)a3
{
  id v5;
  CCSetsAccessDaemonDelegate *v6;
  CCSetsAccessDaemonDelegate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCSetsAccessDaemonDelegate;
  v6 = -[CCSetsAccessDaemonDelegate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataManager, a3);

  return v7;
}

- (BOOL)prepareResource:(id)a3 withMode:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  CCDataSiteManager *v8;
  CCDataSiteManager *dataManager;
  BOOL v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  CCSet *v16;
  void *v17;
  CCSet *v18;
  NSObject *v19;
  id v21;

  v6 = a3;
  if (objc_msgSend(v6, "type") != 4)
    goto LABEL_7;
  __biome_log_for_category();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CCSetsAccessDaemonDelegate prepareResource:withMode:].cold.4((uint64_t)v6, a4, v7);

  if (self->_dataManager
    || (+[CCDataSiteManager defaultManager](CCDataSiteManager, "defaultManager"),
        v8 = (CCDataSiteManager *)objc_claimAutoreleasedReturnValue(),
        dataManager = self->_dataManager,
        self->_dataManager = v8,
        dataManager,
        self->_dataManager))
  {
    if ((a4 & 2) == 0)
    {
LABEL_7:
      v10 = 1;
      goto LABEL_23;
    }
  }
  else
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CCSetsAccessDaemonDelegate prepareResource:withMode:].cold.3(v11);

    if ((a4 & 2) == 0)
      goto LABEL_7;
  }
  CCTypeIdentifierRegistryBridge();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "itemTypeForSetIdentifier:", v13);

  if ((_DWORD)v14 == (unsigned __int16)CCTypeIdentifierUnknown)
  {
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CCSetsAccessDaemonDelegate prepareResource:withMode:].cold.1(v6, v15);
    v10 = 0;
  }
  else
  {
    v16 = [CCSet alloc];
    objc_msgSend(v6, "descriptors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v18 = -[CCSet initWithItemType:descriptors:error:](v16, "initWithItemType:descriptors:error:", v14, v17, &v21);
    v15 = v21;

    if (!v18 || v15)
    {
      __biome_log_for_category();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[CCSetsAccessDaemonDelegate prepareResource:withMode:].cold.2(v6, v14, v19);

      v10 = 0;
    }
    else
    {
      v10 = -[CCDataSiteManager prepareDataResourceForSet:](self->_dataManager, "prepareDataResourceForSet:", v18);
    }

  }
LABEL_23:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataManager, 0);
}

- (void)prepareResource:(void *)a1 withMode:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_237B25000, a2, OS_LOG_TYPE_ERROR, "CCSetsAccessDaemonDelegate could not resolve itemType for resource name: %@", (uint8_t *)&v4, 0xCu);

}

- (void)prepareResource:(NSObject *)a3 withMode:.cold.2(void *a1, int a2, NSObject *a3)
{
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "descriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 67109378;
  v6[1] = a2;
  v7 = 2112;
  v8 = v5;
  _os_log_error_impl(&dword_237B25000, a3, OS_LOG_TYPE_ERROR, "CCSetsAccessDaemonDelegate could not resolve set for itemType: %hu, descriptors: %@", (uint8_t *)v6, 0x12u);

  OUTLINED_FUNCTION_0_4();
}

- (void)prepareResource:(os_log_t)log withMode:.cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_237B25000, log, OS_LOG_TYPE_ERROR, "CCSetsAccessDaemonDelegate could not initialize data manager", v1, 2u);
}

- (void)prepareResource:(NSObject *)a3 withMode:.cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  BMAccessModePrintableDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_237B25000, a3, OS_LOG_TYPE_DEBUG, "CCSetsAccessDaemonDelegate preparing resource %{public}@ for mode %{public}@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_0_4();
}

@end
