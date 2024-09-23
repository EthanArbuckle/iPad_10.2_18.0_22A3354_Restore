@implementation CAFGroupDisableNotificationRequest

- (void)addControl:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__CAFGroupDisableNotificationRequest_addControl___block_invoke;
  v6[3] = &unk_2508FD240;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CAFGroupRequest _lockedPerformBlock:](self, "_lockedPerformBlock:", v6);

}

void __49__CAFGroupDisableNotificationRequest_addControl___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "requestForControl:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "_addRequest:", v2);
    v2 = v3;
  }

}

- (id)requestForCharacteristic:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "notifies"))
  {
    +[CAFRequest requestWithCharacteristic:](CAFDisableNotificationRequest, "requestWithCharacteristic:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)requestForControl:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "notifies"))
  {
    +[CAFRequest requestWithControl:](CAFDisableNotificationRequest, "requestWithControl:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)groupRequestValueForRequests:(id)a3
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if (!v4 || (v5 = v4, (objc_opt_isKindOfClass() & 1) == 0))
  {

    CAFGeneralLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CAFGroupEnableNotificationRequest groupRequestValueForRequests:].cold.1(v6);

    v5 = 0;
  }
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "characteristic", (_QWORD)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "registrationInstanceIDs");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v15);

        objc_msgSend(v13, "control");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "registrationInstanceIDs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v17);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)completedRequests:(id)a3 withResponse:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a4, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v28 = v5;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v39;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v39 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v10);
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          objc_msgSend(v11, "characteristic", v28);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "registrationInstanceIDs");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v35;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v35 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v17);
                objc_msgSend(v11, "characteristic");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "handleRegistrationWithInstanceID:registered:", v18, 0);

                ++v17;
              }
              while (v15 != v17);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
            }
            while (v15);
          }

          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          objc_msgSend(v11, "control");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "registrationInstanceIDs");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v31;
            do
            {
              v25 = 0;
              do
              {
                if (*(_QWORD *)v31 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v25);
                objc_msgSend(v11, "control");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "handleRegistrationWithInstanceID:registered:", v26, 0);

                ++v25;
              }
              while (v23 != v25);
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
            }
            while (v23);
          }

          ++v10;
        }
        while (v10 != v8);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v8);
    }

    v5 = v28;
  }

}

@end
