@implementation UARPDynamicAssetCmapEvent

- (UARPDynamicAssetCmapEvent)init
{
  -[UARPDynamicAssetCmapEvent doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UARPDynamicAssetCmapEvent)initWithSectionName:(id)a3 decoderId:(unsigned int)a4 inputDictionary:(id)a5
{
  id v8;
  id v9;
  UARPDynamicAssetCmapEvent *v10;
  uint64_t v11;
  NSString *sectionName;
  os_log_t v13;
  OS_os_log *log;
  NSMutableDictionary *v15;
  NSMutableDictionary *input;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  NSMutableDictionary *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v30.receiver = self;
  v30.super_class = (Class)UARPDynamicAssetCmapEvent;
  v10 = -[UARPDynamicAssetCmapEvent init](&v30, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    sectionName = v10->_sectionName;
    v10->_sectionName = (NSString *)v11;

    v13 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
    log = v10->_log;
    v10->_log = (OS_os_log *)v13;

    v10->_decoderId = a4;
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    input = v10->_input;
    v10->_input = v15;

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v9, "allKeys", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          v23 = v10->_input;
          objc_msgSend(v9, "objectForKeyedSubscript:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setValue:forKey:](v23, "setValue:forKey:", v24, v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v19);
    }

  }
  return v10;
}

- (UARPDynamicAssetCmapEvent)initWithCoder:(id)a3
{
  id v4;
  UARPDynamicAssetCmapEvent *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *input;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  os_log_t v12;
  OS_os_log *log;
  uint64_t v14;
  NSString *sectionName;
  UARPDynamicAssetCmapEvent *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UARPDynamicAssetCmapEvent;
  v5 = -[UARPDynamicAssetCmapEvent init](&v18, sel_init);
  if (v5)
  {
    v5->_decoderId = objc_msgSend(v4, "decodeIntForKey:", CFSTR("decoderId"));
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    input = v5->_input;
    v5->_input = v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("input"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPDynamicAssetCmapEvent encodedClasses](UARPDynamicAssetCmapEvent, "encodedClasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v9, v8, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v5->_input;
    v5->_input = (NSMutableDictionary *)v10;

    if (!v5->_input && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[UARPDynamicAssetCmapEvent initWithCoder:].cold.1();
    v12 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
    log = v5->_log;
    v5->_log = (OS_os_log *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SectionName"));
    v14 = objc_claimAutoreleasedReturnValue();
    sectionName = v5->_sectionName;
    v5->_sectionName = (NSString *)v14;

    v16 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t decoderId;
  id v5;
  id v6;

  decoderId = self->_decoderId;
  v5 = a3;
  objc_msgSend(v5, "encodeInt:forKey:", decoderId, CFSTR("decoderId"));
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_input, 1, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("input"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sectionName, CFSTR("SectionName"));

}

- (BOOL)isSection:(id)a3
{
  return -[NSString isEqualToString:](self->_sectionName, "isEqualToString:", a3);
}

- (BOOL)decodeCrash:(id)a3 inDictionary:(id)a4
{
  id v6;
  id v7;
  UARPDynamicAssetCrashLogDecoder *v8;
  BOOL v9;

  v6 = a4;
  v7 = a3;
  v8 = -[UARPDynamicAssetCrashLogDecoder initWithDecoderId:sectionName:inputDictionary:]([UARPDynamicAssetCrashLogDecoder alloc], "initWithDecoderId:sectionName:inputDictionary:", self->_decoderId, self->_sectionName, self->_input);
  v9 = -[UARPDynamicAssetCrashLogDecoder decodeCrashLog:inDictionary:](v8, "decodeCrashLog:inDictionary:", v7, v6);

  return v9;
}

+ (id)encodedClasses
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unsigned)uuid
{
  return self->_uuid;
}

- (unsigned)decoderId
{
  return self->_decoderId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_sectionName, 0);
}

- (void)initWithCoder:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_212D08000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "CMAP input is NULL", v0, 2u);
}

@end
