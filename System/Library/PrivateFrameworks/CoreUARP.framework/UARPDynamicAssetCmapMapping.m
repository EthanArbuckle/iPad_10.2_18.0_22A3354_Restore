@implementation UARPDynamicAssetCmapMapping

- (UARPDynamicAssetCmapMapping)init
{
  -[UARPDynamicAssetCmapMapping doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UARPDynamicAssetCmapMapping)initWithEvents:(id)a3 appleModelNumber:(id)a4
{
  id v6;
  id v7;
  OS_os_log *v8;
  OS_os_log *log;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  UARPDynamicAssetCmapEvent *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  NSArray *cmapEvents;
  UARPDynamicAssetCmapMapping *v24;
  id v26;
  UARPDynamicAssetCmapMapping *v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (OS_os_log *)os_log_create("com.apple.accessoryupdater.uarp", "crsh");
  log = self->_log;
  self->_log = v8;

  objc_storeStrong((id *)&self->_appleModelNumber, a4);
  v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    v26 = v7;
    v27 = self;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("decoderId"), v26);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
          goto LABEL_23;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)v27->_log, OS_LOG_TYPE_ERROR))
            -[UARPDynamicAssetCmapMapping initWithEvents:appleModelNumber:].cold.3();
          goto LABEL_23;
        }
        v16 = objc_msgSend(v15, "unsignedIntValue");
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("SectionName"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
          goto LABEL_22;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)v27->_log, OS_LOG_TYPE_ERROR))
            -[UARPDynamicAssetCmapMapping initWithEvents:appleModelNumber:].cold.2();
          goto LABEL_22;
        }
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("InputDictionary"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18)
          goto LABEL_21;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)v27->_log, OS_LOG_TYPE_ERROR))
            -[UARPDynamicAssetCmapMapping initWithEvents:appleModelNumber:].cold.1();
LABEL_21:

LABEL_22:
LABEL_23:

          v20 = obj;
          v24 = 0;
          v7 = v26;
          self = v27;
          v21 = v29;
          goto LABEL_24;
        }
        v19 = -[UARPDynamicAssetCmapEvent initWithSectionName:decoderId:inputDictionary:]([UARPDynamicAssetCmapEvent alloc], "initWithSectionName:decoderId:inputDictionary:", v17, v16, v18);
        objc_msgSend(v29, "addObject:", v19);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v7 = v26;
      self = v27;
      if (v11)
        continue;
      break;
    }
  }
  v20 = obj;

  v21 = v29;
  v22 = (NSArray *)objc_msgSend(v29, "copy");
  cmapEvents = self->_cmapEvents;
  self->_cmapEvents = v22;

  v24 = self;
LABEL_24:

  return v24;
}

- (UARPDynamicAssetCmapMapping)initWithCoder:(id)a3
{
  id v4;
  UARPDynamicAssetCmapMapping *v5;
  os_log_t v6;
  OS_os_log *log;
  uint64_t v8;
  NSString *appleModelNumber;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *cmapEvents;
  NSObject *v15;
  NSString *v16;
  UARPDynamicAssetCmapMapping *v17;
  objc_super v19;
  uint8_t buf[4];
  NSString *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UARPDynamicAssetCmapMapping;
  v5 = -[UARPDynamicAssetCmapMapping init](&v19, sel_init);
  if (v5)
  {
    v6 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
    log = v5->_log;
    v5->_log = (OS_os_log *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AppleModelNumber"));
    v8 = objc_claimAutoreleasedReturnValue();
    appleModelNumber = v5->_appleModelNumber;
    v5->_appleModelNumber = (NSString *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("CmapEvents"));
    v13 = objc_claimAutoreleasedReturnValue();
    cmapEvents = v5->_cmapEvents;
    v5->_cmapEvents = (NSArray *)v13;

    v15 = v5->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = v5->_appleModelNumber;
      *(_DWORD *)buf = 138412290;
      v21 = v16;
      _os_log_impl(&dword_212D08000, v15, OS_LOG_TYPE_INFO, "amn: %@", buf, 0xCu);
    }
    v17 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *appleModelNumber;
  id v5;

  appleModelNumber = self->_appleModelNumber;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", appleModelNumber, CFSTR("AppleModelNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cmapEvents, CFSTR("CmapEvents"));

}

- (BOOL)isEqualAppleModel:(id)a3
{
  return -[NSString isEqualToString:](self->_appleModelNumber, "isEqualToString:", a3);
}

- (id)findCmapEvent:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *log;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_cmapEvents;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isSection:", v4, (_QWORD)v14) & 1) != 0)
        {
          v12 = v10;

          goto LABEL_13;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    -[UARPDynamicAssetCmapMapping findCmapEvent:].cold.1(log);
  v12 = 0;
LABEL_13:

  return v12;
}

- (BOOL)appendCmapEvents:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UARPDynamicAssetCmapMapping *v17;
  const __CFString *v18;
  uint64_t v19;
  NSArray *v20;
  UARPDynamicAssetCmapEvent *v21;
  NSArray *v22;
  NSArray *cmapEvents;
  BOOL v24;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)-[NSArray mutableCopy](self->_cmapEvents, "mutableCopy");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = (NSArray *)v4;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    v10 = CFSTR("SectionName");
    v28 = v5;
    v26 = CFSTR("decoderId");
    while (2)
    {
      v11 = 0;
      v27 = v8;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
        objc_msgSend(v12, "objectForKeyedSubscript:", v10, v26);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
          goto LABEL_25;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
            -[UARPDynamicAssetCmapMapping initWithEvents:appleModelNumber:].cold.2();
          goto LABEL_25;
        }
        -[UARPDynamicAssetCmapMapping findCmapEvent:](self, "findCmapEvent:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("InputDictionary"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
            goto LABEL_24;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
              -[UARPDynamicAssetCmapMapping initWithEvents:appleModelNumber:].cold.1();
            goto LABEL_24;
          }
          objc_msgSend(v12, "objectForKeyedSubscript:", v26);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
            goto LABEL_23;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
              -[UARPDynamicAssetCmapMapping appendCmapEvents:].cold.1();
LABEL_23:

LABEL_24:
LABEL_25:

            v24 = 0;
            cmapEvents = v6;
            v5 = v28;
            goto LABEL_26;
          }
          v17 = self;
          v18 = v10;
          v19 = v9;
          v20 = v6;
          v21 = -[UARPDynamicAssetCmapEvent initWithSectionName:decoderId:inputDictionary:]([UARPDynamicAssetCmapEvent alloc], "initWithSectionName:decoderId:inputDictionary:", v13, objc_msgSend(v16, "unsignedIntValue"), v15);
          objc_msgSend(v28, "addObject:", v21);

          v6 = v20;
          v9 = v19;
          v10 = v18;
          self = v17;
          v8 = v27;

        }
        ++v11;
      }
      while (v8 != v11);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      v5 = v28;
      if (v8)
        continue;
      break;
    }
  }

  v22 = (NSArray *)objc_msgSend(v5, "copy");
  cmapEvents = self->_cmapEvents;
  self->_cmapEvents = v22;
  v24 = 1;
LABEL_26:

  return v24;
}

- (id)expandCrshDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[4];
  uint64_t v37;
  uint8_t v38[4];
  uint64_t v39;
  _BYTE v40[128];
  _QWORD v41[9];
  _QWORD v42[11];

  v42[9] = *MEMORY[0x24BDAC8D0];
  v28 = a3;
  v4 = (void *)objc_opt_new();
  v41[0] = CFSTR("mailboxes");
  v30 = (void *)objc_opt_new();
  v42[0] = v30;
  v41[1] = CFSTR("panic");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v29;
  v41[2] = CFSTR("crashlog-version");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v26;
  v41[3] = CFSTR("exception");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v5;
  v41[4] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v6;
  v41[5] = CFSTR("call-stack");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v7;
  v41[6] = CFSTR("tasks");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v8;
  v41[7] = CFSTR("registers");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v9;
  v41[8] = CFSTR("scenario");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42[8] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v4;
  objc_msgSend(v4, "setDictionary:", v11);

  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("panic"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("panic"));
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("crashlog-version"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("crashlog-version"));
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("exception"));
  v14 = objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("exception"));
  v27 = (void *)v14;
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("sections"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v33;
    v19 = MEMORY[0x24BDACB70];
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("section-name"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UARPDynamicAssetCmapMapping findCmapEvent:](self, "findCmapEvent:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          if ((objc_msgSend(v23, "decodeCrash:inDictionary:", v21, v31) & 1) == 0
            && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            -[UARPDynamicAssetCmapMapping expandCrshDictionary:].cold.2(v36, (uint64_t)v22, &v37);
          }
        }
        else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          -[UARPDynamicAssetCmapMapping expandCrshDictionary:].cold.1(v38, (uint64_t)v22, &v39);
        }

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v17);
  }

  return v31;
}

+ (id)tag
{
  return -[UARPAssetTag initWithString:]([UARPAssetTag alloc], "initWithString:", CFSTR("CMAP"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmapEvents, 0);
  objc_storeStrong((id *)&self->_appleModelNumber, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)initWithEvents:appleModelNumber:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "CMAP Input Dictionary must be Dictionary: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithEvents:appleModelNumber:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "CMAP Section Name must be String: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithEvents:appleModelNumber:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "CMAP decoder Id must be Number: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)findCmapEvent:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_212D08000, log, OS_LOG_TYPE_ERROR, "Unable to find matching CMAP Event.", v1, 2u);
}

- (void)appendCmapEvents:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "CMAP decoderId must be Number: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)expandCrshDictionary:(_QWORD *)a3 .cold.1(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1_1(&dword_212D08000, MEMORY[0x24BDACB70], (uint64_t)a3, "No Cmap Event for SectionName:%@", a1);
}

- (void)expandCrshDictionary:(_QWORD *)a3 .cold.2(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1_1(&dword_212D08000, MEMORY[0x24BDACB70], (uint64_t)a3, "Unable to add section:%@", a1);
}

@end
