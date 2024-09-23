@implementation CAFGroupEnableNotificationRequest

- (void)addControl:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__CAFGroupEnableNotificationRequest_addControl___block_invoke;
  v6[3] = &unk_2508FD240;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CAFGroupRequest _lockedPerformBlock:](self, "_lockedPerformBlock:", v6);

}

void __48__CAFGroupEnableNotificationRequest_addControl___block_invoke(uint64_t a1)
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
    +[CAFRequest requestWithCharacteristic:](CAFEnableNotificationRequest, "requestWithCharacteristic:", v3);
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
    +[CAFRequest requestWithControl:](CAFEnableNotificationRequest, "requestWithControl:", v3);
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
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v42 = v5;
    obj = v5;
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (!v45)
      goto LABEL_37;
    v44 = *(_QWORD *)v56;
    while (1)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v56 != v44)
          objc_enumerationMutation(obj);
        v46 = v8;
        v9 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v8);
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        objc_msgSend(v9, "characteristic");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "registrationInstanceIDs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v52;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v52 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v15);
              objc_msgSend(v6, "values");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKeyedSubscript:", v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x24BDBCEF8], "null");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v18, "isEqual:", v19);

              if (v20)
              {
                objc_msgSend(v9, "characteristic");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = v21;
                v23 = v16;
                v24 = 0;
LABEL_16:
                objc_msgSend(v21, "handleRegistrationWithInstanceID:value:registered:", v23, v24, 1);
                goto LABEL_17;
              }
              objc_msgSend(v9, "characteristic");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v21;
              v23 = v16;
              if (v18)
              {
                v24 = v18;
                goto LABEL_16;
              }
              objc_msgSend(v21, "handleRegistrationWithInstanceID:registered:", v16, 0);
LABEL_17:

              ++v15;
            }
            while (v13 != v15);
            v25 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
            v13 = v25;
          }
          while (v25);
        }

        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        objc_msgSend(v9, "control");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "registrationInstanceIDs");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
        if (!v28)
          goto LABEL_35;
        v29 = v28;
        v30 = *(_QWORD *)v48;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v48 != v30)
              objc_enumerationMutation(v27);
            v32 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v31);
            objc_msgSend(v6, "values");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "objectForKeyedSubscript:", v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v34, "isEqual:", v35);

            if (v36)
            {
              objc_msgSend(v9, "control");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v37;
              v39 = v32;
              v40 = 0;
LABEL_30:
              objc_msgSend(v37, "handleRegistrationWithInstanceID:value:registered:", v39, v40, 1);
              goto LABEL_31;
            }
            objc_msgSend(v9, "control");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v37;
            v39 = v32;
            if (v34)
            {
              v40 = v34;
              goto LABEL_30;
            }
            objc_msgSend(v37, "handleRegistrationWithInstanceID:registered:", v32, 0);
LABEL_31:

            ++v31;
          }
          while (v29 != v31);
          v41 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
          v29 = v41;
        }
        while (v41);
LABEL_35:

        v8 = v46 + 1;
      }
      while (v46 + 1 != v45);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      if (!v45)
      {
LABEL_37:

        v5 = v42;
        break;
      }
    }
  }

}

- (void)groupRequestValueForRequests:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_237717000, log, OS_LOG_TYPE_ERROR, "Generating group enable notification request value failed", v1, 2u);
}

@end
