@implementation UARPDynamicAssetTmapMapping

- (UARPDynamicAssetTmapMapping)init
{
  -[UARPDynamicAssetTmapMapping doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UARPDynamicAssetTmapMapping)initWithEvents:(id)a3 appleModelNumber:(id)a4 endian:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_os_log *v11;
  OS_os_log *log;
  NSString *v13;
  NSString *appleModelNumber;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  UARPDynamicAssetTmapEvent *v23;
  NSArray *v24;
  NSArray *tmapEvents;
  UARPDynamicAssetTmapMapping *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v35;
  UARPDynamicAssetTmapMapping *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (OS_os_log *)os_log_create("com.apple.accessoryupdater.uarp", "tmap");
  log = self->_log;
  self->_log = v11;

  v13 = (NSString *)objc_msgSend(v9, "copy");
  appleModelNumber = self->_appleModelNumber;
  self->_appleModelNumber = v13;

  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v38;
    v35 = v9;
    v36 = self;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("EventID"), v35);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v22)
          goto LABEL_13;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v27 = v36->_log;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            -[UARPDynamicAssetTmapMapping initWithEvents:appleModelNumber:endian:].cold.1((uint64_t)v22, v27, v28, v29, v30, v31, v32, v33);
LABEL_13:

          v26 = 0;
          v9 = v35;
          self = v36;
          goto LABEL_14;
        }
        v23 = -[UARPDynamicAssetTmapEvent initWithEventFields:eventID:endian:]([UARPDynamicAssetTmapEvent alloc], "initWithEventFields:eventID:endian:", v21, objc_msgSend(v22, "unsignedIntValue"), v10);
        objc_msgSend(v15, "addObject:", v23);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      v9 = v35;
      self = v36;
      if (v18)
        continue;
      break;
    }
  }

  v24 = (NSArray *)objc_msgSend(v15, "copy");
  tmapEvents = self->_tmapEvents;
  self->_tmapEvents = v24;

  v26 = self;
LABEL_14:

  return v26;
}

- (UARPDynamicAssetTmapMapping)initWithCoder:(id)a3
{
  id v4;
  UARPDynamicAssetTmapMapping *v5;
  os_log_t v6;
  OS_os_log *log;
  uint64_t v8;
  NSString *appleModelNumber;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *tmapEvents;
  UARPDynamicAssetTmapMapping *v15;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UARPDynamicAssetTmapMapping;
  v5 = -[UARPDynamicAssetTmapMapping init](&v17, sel_init);
  if (v5)
  {
    v6 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
    log = v5->_log;
    v5->_log = (OS_os_log *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AppleModelNumber"));
    v8 = objc_claimAutoreleasedReturnValue();
    appleModelNumber = v5->_appleModelNumber;
    v5->_appleModelNumber = (NSString *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("Events"));
    v13 = objc_claimAutoreleasedReturnValue();
    tmapEvents = v5->_tmapEvents;
    v5->_tmapEvents = (NSArray *)v13;

    v15 = v5;
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_tmapEvents, CFSTR("Events"));

}

- (BOOL)isEqualAppleModel:(id)a3
{
  return -[NSString isEqualToString:](self->_appleModelNumber, "isEqualToString:", a3);
}

- (id)findTmapEvent:(unint64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_tmapEvents;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "eventID", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)expandMticData:(id)a3 withEventID:(unsigned int)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *log;

  v6 = a3;
  -[UARPDynamicAssetTmapMapping findTmapEvent:](self, "findTmapEvent:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "expandMticData:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPDynamicAssetTmapMapping addSysdiagnoseMetrics:coreAnalyticsEvent:](self, "addSysdiagnoseMetrics:coreAnalyticsEvent:", v8, v9);
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[UARPDynamicAssetTmapMapping expandMticData:withEventID:].cold.1(a4, log);
    v9 = 0;
  }

  return v9;
}

- (void)addSysdiagnoseMetrics:(id)a3 coreAnalyticsEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSString *appleModelNumber;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *log;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v6 = a3;
  v7 = a4;
  +[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", self->_appleModelNumber);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sysdiagnoseApprovedMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    objc_msgSend(v8, "sysdiagnoseApprovedMetrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eventName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "containsObject:", v12))
    {
      appleModelNumber = self->_appleModelNumber;
      UARPStringPifMetricsFilePath();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      UARPUniqueFilename(appleModelNumber, 0, v14, 0, CFSTR(".log"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v7, 0, &v26);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v26;
      if (v17)
      {
        UARPWriteFile(v17, v16);
      }
      else
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          -[UARPDynamicAssetTmapMapping addSysdiagnoseMetrics:coreAnalyticsEvent:].cold.1((uint64_t)v18, log, v20, v21, v22, v23, v24, v25);
      }

    }
  }

}

- (BOOL)appendTmapEvents:(id)a3 endian:(id)a4
{
  id v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  UARPDynamicAssetTmapEvent *v17;
  NSArray *v18;
  NSArray *tmapEvents;
  BOOL v20;
  NSObject *log;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v30 = a4;
  v7 = (void *)-[NSArray mutableCopy](self->_tmapEvents, "mutableCopy");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = (NSArray *)v6;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    v29 = v7;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("EventID"), v29);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
          goto LABEL_15;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            -[UARPDynamicAssetTmapMapping initWithEvents:appleModelNumber:endian:].cold.1((uint64_t)v14, log, v22, v23, v24, v25, v26, v27);
LABEL_15:

          v20 = 0;
          tmapEvents = v8;
          v7 = v29;
          goto LABEL_16;
        }
        v15 = objc_msgSend(v14, "unsignedIntValue");
        -[UARPDynamicAssetTmapMapping findTmapEvent:](self, "findTmapEvent:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          v17 = -[UARPDynamicAssetTmapEvent initWithEventFields:eventID:endian:]([UARPDynamicAssetTmapEvent alloc], "initWithEventFields:eventID:endian:", v13, v15, v30);
          objc_msgSend(v29, "addObject:", v17);

        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      v7 = v29;
      if (v10)
        continue;
      break;
    }
  }

  v18 = (NSArray *)objc_msgSend(v7, "copy");
  tmapEvents = self->_tmapEvents;
  self->_tmapEvents = v18;
  v20 = 1;
LABEL_16:

  return v20;
}

+ (id)tag
{
  return -[UARPAssetTag initWithString:]([UARPAssetTag alloc], "initWithString:", CFSTR("TMAP"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_tmapEvents, 0);
  objc_storeStrong((id *)&self->_appleModelNumber, 0);
}

- (void)initWithEvents:(uint64_t)a3 appleModelNumber:(uint64_t)a4 endian:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, a2, a3, "TMAP Field Name must be Number: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)expandMticData:(int)a1 withEventID:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_212D08000, a2, OS_LOG_TYPE_ERROR, "No Tmap Event for Event Index: %u", (uint8_t *)v2, 8u);
}

- (void)addSysdiagnoseMetrics:(uint64_t)a3 coreAnalyticsEvent:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, a2, a3, "Unable to create JSON: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
