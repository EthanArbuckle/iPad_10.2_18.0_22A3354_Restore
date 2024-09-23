@implementation UARPDynamicAssetCrashLogDecoder

- (UARPDynamicAssetCrashLogDecoder)init
{
  -[UARPDynamicAssetCrashLogDecoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UARPDynamicAssetCrashLogDecoder)initWithDecoderId:(unsigned int)a3 sectionName:(id)a4 inputDictionary:(id)a5
{
  id v9;
  id v10;
  UARPDynamicAssetCrashLogDecoder *v11;
  os_log_t v12;
  OS_os_log *log;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UARPDynamicAssetCrashLogDecoder;
  v11 = -[UARPDynamicAssetCrashLogDecoder init](&v15, sel_init);
  if (v11)
  {
    v12 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
    log = v11->_log;
    v11->_log = (OS_os_log *)v12;

    v11->_decoderId = a3;
    objc_storeStrong((id *)&v11->_sectionName, a4);
    objc_storeStrong((id *)&v11->_cmapDictionary, a5);
  }

  return v11;
}

- (BOOL)decodeCrashLog:(id)a3 inDictionary:(id)a4
{
  id v6;
  id v7;
  unsigned int decoderId;
  int *p_decoderId;
  BOOL v10;
  BOOL v11;
  NSObject *log;

  v6 = a3;
  v7 = a4;
  p_decoderId = (int *)&self->_decoderId;
  decoderId = self->_decoderId;
  if (decoderId == 2)
  {
    v10 = -[UARPDynamicAssetCrashLogDecoder createDictionary:inDictionary:](self, "createDictionary:inDictionary:", v6, v7);
    goto LABEL_5;
  }
  if (decoderId == 1)
  {
    v10 = -[UARPDynamicAssetCrashLogDecoder copySectionName:inDictionary:](self, "copySectionName:inDictionary:", v6, v7);
LABEL_5:
    v11 = v10;
    goto LABEL_9;
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    -[UARPDynamicAssetCrashLogDecoder decodeCrashLog:inDictionary:].cold.1(p_decoderId, log);
  v11 = 0;
LABEL_9:

  return v11;
}

- (BOOL)copySectionName:(id)a3 inDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSObject *log;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NSDictionary objectForKey:](self->_cmapDictionary, "objectForKey:", CFSTR("CrashLogKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "allKeys");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          if ((objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), (_QWORD)v24) & 1) != 0)
          {
            objc_msgSend(v6, "objectForKey:", v8);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKey:", v22, v8);

            v21 = 1;
            goto LABEL_14;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v11)
          continue;
        break;
      }
    }

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[UARPDynamicAssetCrashLogDecoder copySectionName:inDictionary:].cold.2((uint64_t)v8, log, v15, v16, v17, v18, v19, v20);
    v21 = 0;
LABEL_14:

  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[UARPDynamicAssetCrashLogDecoder copySectionName:inDictionary:].cold.1();
    v21 = 0;
  }

  return v21;
}

- (BOOL)createDictionary:(id)a3 inDictionary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  int v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  BOOL v24;
  NSObject *log;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  UARPDynamicAssetCrashLogDecoder *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v6 = a4;
  -[NSDictionary objectForKey:](self->_cmapDictionary, "objectForKey:", CFSTR("CrashLogKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSDictionary objectForKey:](self->_cmapDictionary, "objectForKey:", CFSTR("DecodedCrashLogChildKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_cmapDictionary, "objectForKey:", CFSTR("DecodedCrashLogKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8)
    {
      if (v9)
      {
        v11 = objc_msgSend(v8, "count");
        if (v11 == objc_msgSend(v7, "count"))
        {
          v33 = self;
          v34 = v10;
          v35 = v6;
          objc_msgSend(v39, "allKeys");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          if (objc_msgSend(v7, "count"))
          {
            v13 = 0;
            v14 = 0;
            v36 = v7;
            while (1)
            {
              objc_msgSend(v7, "objectAtIndexedSubscript:", v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = 0u;
              v41 = 0u;
              v42 = 0u;
              v43 = 0u;
              v16 = v37;
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
              if (!v17)
                break;
              v18 = v17;
              v38 = v14;
              v19 = 0;
              v20 = *(_QWORD *)v41;
              do
              {
                for (i = 0; i != v18; ++i)
                {
                  if (*(_QWORD *)v41 != v20)
                    objc_enumerationMutation(v16);
                  if (objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "isEqualToString:", v15))
                  {
                    objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "objectForKey:", v15);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "setObject:forKey:", v23, v22);

                    v19 = 1;
                  }
                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
              }
              while (v18);

              v7 = v36;
              if ((v19 & 1) == 0)
                goto LABEL_32;

              v13 = (v38 + 1);
              v14 = v38 + 1;
              if (objc_msgSend(v36, "count") <= v13)
                goto LABEL_18;
            }

LABEL_32:
            log = v33->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              -[UARPDynamicAssetCrashLogDecoder createDictionary:inDictionary:].cold.4((uint64_t)v15, log, v27, v28, v29, v30, v31, v32);

            v24 = 0;
            v10 = v34;
            v6 = v35;
          }
          else
          {
LABEL_18:
            v10 = v34;
            v6 = v35;
            objc_msgSend(v35, "setObject:forKey:", v12, v34);
            v24 = 1;
          }

          goto LABEL_29;
        }
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
          -[UARPDynamicAssetCrashLogDecoder createDictionary:inDictionary:].cold.5();
      }
      else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      {
        -[UARPDynamicAssetCrashLogDecoder createDictionary:inDictionary:].cold.3();
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      -[UARPDynamicAssetCrashLogDecoder createDictionary:inDictionary:].cold.2();
    }
    v24 = 0;
LABEL_29:

    goto LABEL_30;
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    -[UARPDynamicAssetCrashLogDecoder copySectionName:inDictionary:].cold.1();
  v24 = 0;
LABEL_30:

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionName, 0);
  objc_storeStrong((id *)&self->_cmapDictionary, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)decodeCrashLog:(int *)a1 inDictionary:(NSObject *)a2 .cold.1(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_212D08000, a2, OS_LOG_TYPE_ERROR, "UUID (%u) is not defined. Cannot Decode crashLog Dictionary", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_1_0();
}

- (void)copySectionName:inDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "Unable to find 'crashLogKey' in CMAP input dictionary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)copySectionName:(uint64_t)a3 inDictionary:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, a2, a3, "Unable to find value for key:%@ in crash log dictionary.", a5, a6, a7, a8, 2u);
}

- (void)createDictionary:inDictionary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "Unable to find 'decodedChildKey' in CMAP input dictionary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)createDictionary:inDictionary:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "Unable to find 'decodedParentKey' in CMAP input dictionary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)createDictionary:(uint64_t)a3 inDictionary:(uint64_t)a4 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, a2, a3, "Crash Log is missing a CMAP specified Key: %@", a5, a6, a7, a8, 2u);
}

- (void)createDictionary:inDictionary:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "Every key in CMAP must have a Decoded Key for Crash Tracer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
