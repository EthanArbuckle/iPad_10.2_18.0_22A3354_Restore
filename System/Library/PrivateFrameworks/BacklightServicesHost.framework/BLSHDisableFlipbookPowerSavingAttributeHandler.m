@implementation BLSHDisableFlipbookPowerSavingAttributeHandler

+ (id)registerHandlerForService:(id)a3 provider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForService:provider:", v7, v6);

  v11[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerAttributeHandler:forAttributeClasses:", v8, v9);

  return v8;
}

- (id)initForService:(id)a3 provider:(id)a4
{
  id v6;
  BLSHDisableFlipbookPowerSavingAttributeHandler *v7;
  BLSHDisableFlipbookPowerSavingAttributeHandler *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)BLSHDisableFlipbookPowerSavingAttributeHandler;
  v7 = -[BLSHDisableFlipbookPowerSavingAttributeHandler init](&v10, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_provider, a4);

  return v8;
}

- (void)activateAttributes:(id)a3 fromAssertion:(id)a4 forService:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  BLSHDisableFlipbookPowerSavingAttributeHandler *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[BLSHFlipbookPowerSavingProviding incrementDisablePowerSavingUsageCountForReason:](self->_provider, "incrementDisablePowerSavingUsageCountForReason:", objc_msgSend(v11, "reason"));
        }
        else
        {
          bls_assertions_log();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            v13 = (void *)objc_opt_class();
            *(_DWORD *)buf = 134218498;
            v20 = self;
            v21 = 2112;
            v22 = v11;
            v23 = 2112;
            v24 = v13;
            v14 = v13;
            _os_log_fault_impl(&dword_2145AC000, v12, OS_LOG_TYPE_FAULT, "%p cannot activate invalid attribute:%@ not of class:%@", buf, 0x20u);

          }
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
    }
    while (v8);
  }

}

- (void)deactivateAttributes:(id)a3 fromAssertion:(id)a4 forService:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  BLSHDisableFlipbookPowerSavingAttributeHandler *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[BLSHFlipbookPowerSavingProviding decrementDisablePowerSavingUsageCountForReason:](self->_provider, "decrementDisablePowerSavingUsageCountForReason:", objc_msgSend(v11, "reason"));
        }
        else
        {
          bls_assertions_log();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            v13 = (void *)objc_opt_class();
            *(_DWORD *)buf = 134218498;
            v20 = self;
            v21 = 2112;
            v22 = v11;
            v23 = 2112;
            v24 = v13;
            v14 = v13;
            _os_log_fault_impl(&dword_2145AC000, v12, OS_LOG_TYPE_FAULT, "%p cannot deactivate invalid attribute:%@ not of class:%@", buf, 0x20u);

          }
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
    }
    while (v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
