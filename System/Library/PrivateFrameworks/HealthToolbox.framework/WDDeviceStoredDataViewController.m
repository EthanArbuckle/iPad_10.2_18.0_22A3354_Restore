@implementation WDDeviceStoredDataViewController

- (id)storedDataPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD3E88];
  v3 = (void *)MEMORY[0x24BDBCF20];
  -[WDDeviceStoredDataViewController device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateForObjectsFromDevices:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)storedDataDisplayName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[WDDeviceStoredDataViewController displayName](self, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[WDDeviceStoredDataViewController device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)shouldShowDeleteAllDataButton
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;

  -[WDStoredDataByCategoryViewController profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "healthStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 3)
    return 0;
  -[WDStoredDataByCategoryViewController capturedSampleTypes](self, "capturedSampleTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
    v7 = 1;
  else
    v7 = objc_msgSend(MEMORY[0x24BDD4198], "isAppleInternalInstall");

  return v7;
}

- (void)deleteAllStoredData
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD block[7];
  _QWORD v15[5];
  NSObject *v16;
  _QWORD *v17;
  SEL v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[3];
  char v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[WDDeviceStoredDataViewController storedDataPredicate](self, "storedDataPredicate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 1;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v21 = 0u;
  v22 = 0u;
  v20 = 0u;
  v19 = 0u;
  -[WDStoredDataByCategoryViewController capturedSampleTypes](self, "capturedSampleTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8);
        dispatch_group_enter(v4);
        -[WDStoredDataByCategoryViewController profile](self, "profile");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "healthStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __55__WDDeviceStoredDataViewController_deleteAllStoredData__block_invoke;
        v15[3] = &unk_24D38D3C8;
        v15[4] = v9;
        v17 = v23;
        v18 = a2;
        v16 = v4;
        objc_msgSend(v11, "deleteObjectsOfType:predicate:withCompletion:", v9, v13, v15);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v6);
  }

  dispatch_group_leave(v4);
  dispatch_get_global_queue(0, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__WDDeviceStoredDataViewController_deleteAllStoredData__block_invoke_186;
  block[3] = &unk_24D38D118;
  block[4] = self;
  block[5] = v23;
  block[6] = a2;
  dispatch_group_notify(v4, v12, block);

  _Block_object_dispose(v23, 8);
}

void __55__WDDeviceStoredDataViewController_deleteAllStoredData__block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;

  v6 = a4;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x24BDD2FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
      __55__WDDeviceStoredDataViewController_deleteAllStoredData__block_invoke_cold_1(a1, v7, (uint64_t)v6);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __55__WDDeviceStoredDataViewController_deleteAllStoredData__block_invoke_186(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v2 = objc_alloc(MEMORY[0x24BDD3B28]);
    objc_msgSend(*(id *)(a1 + 32), "profile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "healthStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v2, "initWithHealthStore:", v4);

    objc_msgSend(*(id *)(a1 + 32), "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __55__WDDeviceStoredDataViewController_deleteAllStoredData__block_invoke_2;
    v7[3] = &__block_descriptor_40_e20_v20__0B8__NSError_12l;
    v7[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "deleteDevice:completion:", v6, v7);

  }
}

void __55__WDDeviceStoredDataViewController_deleteAllStoredData__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD2FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
      __55__WDDeviceStoredDataViewController_deleteAllStoredData__block_invoke_2_cold_1(a1, v6, (uint64_t)v5);
  }

}

- (HKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

void __55__WDDeviceStoredDataViewController_deleteAllStoredData__block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  const char *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = *(const char **)(a1 + 56);
  v6 = a2;
  NSStringFromSelector(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = 138412802;
  v10 = v7;
  v11 = 2112;
  v12 = v8;
  v13 = 2112;
  v14 = a3;
  _os_log_error_impl(&dword_215814000, v6, OS_LOG_TYPE_ERROR, "%@ deleteObjectsOfType: %@ %@", (uint8_t *)&v9, 0x20u);

}

void __55__WDDeviceStoredDataViewController_deleteAllStoredData__block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  const char *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *(const char **)(a1 + 32);
  v5 = a2;
  NSStringFromSelector(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a3;
  _os_log_error_impl(&dword_215814000, v5, OS_LOG_TYPE_ERROR, "%@ Error deleting device: %@", (uint8_t *)&v7, 0x16u);

}

@end
