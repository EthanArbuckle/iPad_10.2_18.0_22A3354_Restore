@implementation ASDPluginDSPDatabase

- (ASDPluginDSPDatabase)initWithDictionary:(id)a3 resourcePath:(id)a4
{
  id v6;
  id v7;
  ASDPluginDSPDatabase *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  ASDAudioDeviceDSPDatabase *v17;
  ASDAudioDeviceDSPDatabase *v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  ASDPluginDSPDatabase *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)ASDPluginDSPDatabase;
  v8 = -[ASDPluginDSPDatabase init](&v34, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v31;
      v28 = v8;
      v29 = v6;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", v15, v28);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || (v17 = -[ASDAudioDeviceDSPDatabase initWithDictionary:resourcePath:deviceUID:]([ASDAudioDeviceDSPDatabase alloc], "initWithDictionary:resourcePath:deviceUID:", v16, v7, v15)) == 0)
          {

            v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v19)
              -[ASDPluginDSPDatabase initWithDictionary:resourcePath:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);

            v8 = 0;
            v6 = v29;
            goto LABEL_15;
          }
          v18 = v17;
          objc_msgSend(v9, "setObject:forKey:", v17, v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        v8 = v28;
        v6 = v29;
        if (v12)
          continue;
        break;
      }
    }

    objc_storeStrong((id *)&v8->_deviceDatabases, v9);
LABEL_15:

  }
  return v8;
}

- (NSDictionary)deviceDatabases
{
  return self->_deviceDatabases;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceDatabases, 0);
}

- (void)initWithDictionary:(uint64_t)a3 resourcePath:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "ASDPluginDSPDatabase parse failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

@end
