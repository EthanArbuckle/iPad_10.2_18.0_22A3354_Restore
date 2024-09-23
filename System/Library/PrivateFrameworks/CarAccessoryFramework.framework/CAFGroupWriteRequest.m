@implementation CAFGroupWriteRequest

- (void)addCharacteristic:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  CAFGroupWriteRequest *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__CAFGroupWriteRequest_addCharacteristic_value___block_invoke;
  v10[3] = &unk_2508FD358;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  -[CAFGroupRequest _lockedPerformBlock:](self, "_lockedPerformBlock:", v10);

}

void __48__CAFGroupWriteRequest_addCharacteristic_value___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  +[CAFWriteRequest requestWithCharacteristic:value:](CAFWriteRequest, "requestWithCharacteristic:value:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 48), "_addRequest:", v2);
    v2 = v3;
  }

}

- (void)addCharacteristicsAndValues:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CAFGroupWriteRequest *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__CAFGroupWriteRequest_addCharacteristicsAndValues___block_invoke;
  v6[3] = &unk_2508FD240;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[CAFGroupRequest _lockedPerformBlock:](self, "_lockedPerformBlock:", v6);

}

uint64_t __52__CAFGroupWriteRequest_addCharacteristicsAndValues___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__CAFGroupWriteRequest_addCharacteristicsAndValues___block_invoke_2;
  v3[3] = &unk_2508FD380;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __52__CAFGroupWriteRequest_addCharacteristicsAndValues___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;

  +[CAFWriteRequest requestWithCharacteristic:value:](CAFWriteRequest, "requestWithCharacteristic:value:", a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "_addRequest:", v4);
    v4 = v5;
  }

}

- (id)requestForCharacteristic:(id)a3
{
  return 0;
}

- (id)groupRequestValueForRequests:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if (!v5 || (v6 = v5, (objc_opt_isKindOfClass() & 1) == 0))
  {

    CAFGeneralLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CAFGroupWriteRequest groupRequestValueForRequests:].cold.1(v7);

    v6 = 0;
  }
  v20 = v5;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (!v15)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v3;
        }
        objc_msgSend(v14, "characteristic");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "instanceID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v18);

        if (!v15)
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  return v8;
}

- (void)completedRequests:(id)a3 withResponse:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v21 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
          objc_msgSend(v6, "values");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "characteristic");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "instanceID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v13, "characteristic");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "characteristic");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "instanceID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "handleWrite:value:", v20, v17);

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

    v5 = v21;
  }

}

- (void)groupRequestValueForRequests:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_237717000, log, OS_LOG_TYPE_ERROR, "Generating group write request value failed", v1, 2u);
}

@end
