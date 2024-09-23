@implementation UARPDynamicAssetTmapEvent

- (UARPDynamicAssetTmapEvent)init
{
  -[UARPDynamicAssetTmapEvent doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UARPDynamicAssetTmapEvent)initWithEventFields:(id)a3 eventID:(unsigned int)a4 endian:(id)a5
{
  id v8;
  id v9;
  UARPDynamicAssetTmapEvent *v10;
  os_log_t v11;
  OS_os_log *log;
  void *v13;
  uint64_t v14;
  NSString *eventName;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  TmapFieldTLV *v22;
  uint64_t v23;
  NSArray *eventFields;
  UARPDynamicAssetTmapEvent *v25;
  NSObject *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v32.receiver = self;
  v32.super_class = (Class)UARPDynamicAssetTmapEvent;
  v10 = -[UARPDynamicAssetTmapEvent init](&v32, sel_init);
  if (!v10)
  {
LABEL_13:
    v25 = 0;
    goto LABEL_14;
  }
  v11 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
  log = v10->_log;
  v10->_log = (OS_os_log *)v11;

  v10->_eventID = a4;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("EventName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "copy");
  eventName = v10->_eventName;
  v10->_eventName = (NSString *)v14;

  if (!v10->_eventName)
  {
    v26 = v10->_log;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[UARPDynamicAssetTmapEvent initWithEventFields:eventID:endian:].cold.1(v26);
    goto LABEL_13;
  }
  v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("EventFields"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v17);
        v22 = -[TmapFieldTLV initWithDictionary:endian:]([TmapFieldTLV alloc], "initWithDictionary:endian:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), v9);
        objc_msgSend(v16, "addObject:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v19);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v16);
  v23 = objc_claimAutoreleasedReturnValue();
  eventFields = v10->_eventFields;
  v10->_eventFields = (NSArray *)v23;

  v25 = v10;
LABEL_14:

  return v25;
}

- (UARPDynamicAssetTmapEvent)initWithCoder:(id)a3
{
  id v4;
  UARPDynamicAssetTmapEvent *v5;
  uint64_t v6;
  NSString *eventName;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *eventFields;
  os_log_t v13;
  OS_os_log *log;
  UARPDynamicAssetTmapEvent *v15;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UARPDynamicAssetTmapEvent;
  v5 = -[UARPDynamicAssetTmapEvent init](&v17, sel_init);
  if (v5)
  {
    v5->_eventID = objc_msgSend(v4, "decodeIntForKey:", CFSTR("EventID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EventName"));
    v6 = objc_claimAutoreleasedReturnValue();
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("EventFields"));
    v11 = objc_claimAutoreleasedReturnValue();
    eventFields = v5->_eventFields;
    v5->_eventFields = (NSArray *)v11;

    v13 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
    log = v5->_log;
    v5->_log = (OS_os_log *)v13;

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
  uint64_t eventID;
  id v5;

  eventID = self->_eventID;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", eventID, CFSTR("EventID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventName, CFSTR("EventName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventFields, CFSTR("EventFields"));

}

- (id)expandMticData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *log;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)-[NSString copy](self->_eventName, "copy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("EventName"));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_eventFields;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (!objc_msgSend(v13, "expandFieldData:withOffset:inCoreAnalytics:", v4, v10, v5)
          || (v17 = 0, !objc_msgSend(v13, "getNextOffset:fromStart:", &v17, v10)))
        {

          goto LABEL_17;
        }
        v10 = v17;
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }

  if (v10 == objc_msgSend(v4, "length"))
  {
    v14 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[UARPDynamicAssetTmapEvent expandMticData:].cold.1(log, v4, v10);
LABEL_17:
    v14 = 0;
  }

  return v14;
}

- (unsigned)eventID
{
  return self->_eventID;
}

- (NSString)eventName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_eventFields, 0);
}

- (void)initWithEventFields:(os_log_t)log eventID:endian:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[UARPDynamicAssetTmapEvent initWithEventFields:eventID:endian:]";
  _os_log_error_impl(&dword_212D08000, log, OS_LOG_TYPE_ERROR, "%s: Event Name doesn't exist in Tmap Event", (uint8_t *)&v1, 0xCu);
}

- (void)expandMticData:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = 134218240;
  v7 = objc_msgSend(a2, "length");
  v8 = 2048;
  v9 = a3;
  _os_log_error_impl(&dword_212D08000, v5, OS_LOG_TYPE_ERROR, "Lengths of MTIC Data(%lu) and TMAP Data(%lu) do not match.", (uint8_t *)&v6, 0x16u);

}

@end
