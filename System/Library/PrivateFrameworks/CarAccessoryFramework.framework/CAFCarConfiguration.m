@implementation CAFCarConfiguration

- (CAFCarConfiguration)initWithIdentifier:(id)a3 session:(id)a4
{
  id v7;
  id v8;
  CAFCarConfiguration *v9;
  CAFCarConfiguration *v10;
  void *v11;
  uint64_t v12;
  NSString *name;
  void *v14;
  void *v15;
  CAFSessionAnalytics *v16;
  CAFSessionAnalytics *sessionAnalytics;
  NSDictionary *v18;
  NSDictionary *pluginConfigs;
  CAFCachedDescription *v20;
  CAFCachedDescription *cachedDescription;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CAFCarConfiguration;
  v9 = -[CAFCarConfiguration init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uniqueIdentifier, a3);
    objc_msgSend(v8, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = objc_claimAutoreleasedReturnValue();
    name = v10->_name;
    v10->_name = (NSString *)v12;

    objc_msgSend(v8, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_rightHandDrive = objc_msgSend(v14, "rightHandDrive");

    objc_msgSend(v8, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_pluginCount = objc_msgSend(v15, "vehicleDataPluginCount");

    v16 = -[CAFSessionAnalytics initWithSession:]([CAFSessionAnalytics alloc], "initWithSession:", v8);
    sessionAnalytics = v10->_sessionAnalytics;
    v10->_sessionAnalytics = v16;

    v18 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    pluginConfigs = v10->_pluginConfigs;
    v10->_pluginConfigs = v18;

    v20 = -[CAFCachedDescription initWithCacheable:]([CAFCachedDescription alloc], "initWithCacheable:", v10);
    cachedDescription = v10->_cachedDescription;
    v10->_cachedDescription = v20;

  }
  return v10;
}

- (id)copyWithoutPlugins
{
  CAFCarConfiguration *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  unint64_t v7;
  void *v8;
  CAFCarConfiguration *v9;

  v3 = [CAFCarConfiguration alloc];
  -[CAFCarConfiguration name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFCarConfiguration uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CAFCarConfiguration rightHandDrive](self, "rightHandDrive");
  v7 = -[CAFCarConfiguration pluginCount](self, "pluginCount");
  -[CAFCarConfiguration sessionAnalytics](self, "sessionAnalytics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CAFCarConfiguration initWithName:identifier:rightHandDrive:pluginCount:sessionAnalytics:](v3, "initWithName:identifier:rightHandDrive:pluginCount:sessionAnalytics:", v4, v5, v6, v7, v8);

  return v9;
}

- (CAFCarConfiguration)initWithName:(id)a3 identifier:(id)a4 rightHandDrive:(BOOL)a5 pluginCount:(unint64_t)a6 sessionAnalytics:(id)a7
{
  id v13;
  id v14;
  id v15;
  CAFCarConfiguration *v16;
  CAFCarConfiguration *v17;
  NSDictionary *v18;
  NSDictionary *pluginConfigs;
  CAFCachedDescription *v20;
  CAFCachedDescription *cachedDescription;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CAFCarConfiguration;
  v16 = -[CAFCarConfiguration init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_name, a3);
    objc_storeStrong((id *)&v17->_uniqueIdentifier, a4);
    v17->_rightHandDrive = a5;
    v17->_pluginCount = a6;
    objc_storeStrong((id *)&v17->_sessionAnalytics, a7);
    v18 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    pluginConfigs = v17->_pluginConfigs;
    v17->_pluginConfigs = v18;

    v20 = -[CAFCachedDescription initWithCacheable:]([CAFCachedDescription alloc], "initWithCacheable:", v17);
    cachedDescription = v17->_cachedDescription;
    v17->_cachedDescription = v20;

  }
  return v17;
}

- (BOOL)updateConfiguration:(id)a3 pluginConfig:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[CAFCarConfiguration pluginConfigs](self, "pluginConfigs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

  -[CAFCarConfiguration cachedDescription](self, "cachedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsRefreshDescription");

  -[CAFCarConfiguration delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CAFCarConfiguration delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFCarConfiguration pluginConfigs](self, "pluginConfigs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "car:didUpdatePluginConfigs:", self, v12);

  }
  return 1;
}

- (BOOL)updateConfiguration:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __43__CAFCarConfiguration_updateConfiguration___block_invoke;
  v10[3] = &unk_2508FEF30;
  v10[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v10);
  -[CAFCarConfiguration cachedDescription](self, "cachedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsRefreshDescription");

  -[CAFCarConfiguration delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CAFCarConfiguration delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFCarConfiguration pluginConfigs](self, "pluginConfigs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "car:didUpdatePluginConfigs:", self, v8);

  }
  return 1;
}

void __43__CAFCarConfiguration_updateConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  v7 = v5;
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v8 = v6;
    if (v8 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "pluginConfigs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v7);

    }
    else
    {

      CAFGeneralLogging();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __43__CAFCarConfiguration_updateConfiguration___block_invoke_cold_2((uint64_t)v7, v8);
    }

    v10 = v7;
  }
  else
  {

    CAFGeneralLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __43__CAFCarConfiguration_updateConfiguration___block_invoke_cold_1(v10);
  }

}

- (BOOL)isConfigured
{
  unint64_t pluginCount;

  pluginCount = self->_pluginCount;
  return pluginCount && pluginCount == -[NSDictionary count](self->_pluginConfigs, "count");
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[CAFCarConfiguration cachedDescription](self, "cachedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (BOOL)getBoolean:(id)a3 key:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

+ (id)getType:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  +[CAFCarConfiguration getTypeString:](CAFCarConfiguration, "getTypeString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)getTypeString:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%016llX"), objc_msgSend(a3, "unsignedLongLongValue"));
}

+ (id)getUUID:(id)a3 instanceID:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[16];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = objc_msgSend(a3, "longLongValue");
  v7 = objc_msgSend(v5, "longLongValue");

  v9[0] = BYTE3(v6);
  v9[1] = BYTE2(v6);
  v9[2] = BYTE1(v6);
  v9[3] = v6;
  v9[4] = BYTE5(v6);
  v9[5] = BYTE4(v6);
  v9[6] = HIBYTE(v6);
  v9[7] = BYTE6(v6);
  v9[8] = HIBYTE(v7);
  v9[9] = BYTE6(v7);
  v9[10] = BYTE5(v7);
  v9[11] = BYTE4(v7);
  v9[12] = BYTE3(v7);
  v9[13] = BYTE2(v7);
  v9[14] = BYTE1(v7);
  v9[15] = v7;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v9);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAFCarConfiguration)initWithCoder:(id)a3
{
  id v4;
  CAFCarConfiguration *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSUUID *uniqueIdentifier;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSDictionary *pluginConfigs;
  uint64_t v20;
  CAFSessionAnalytics *sessionAnalytics;
  CAFCachedDescription *v22;
  CAFCachedDescription *cachedDescription;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CAFCarConfiguration;
  v5 = -[CAFCarConfiguration init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAFCarConfigurationNameKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAFCarConfigurationUniqueIdentifierKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAFCarConfigurationPluginCountKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pluginCount = objc_msgSend(v10, "unsignedIntValue");

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CAFCarConfigurationPluginConfigs")))
    {
      v11 = (void *)MEMORY[0x24BDBCF20];
      v12 = objc_opt_class();
      v13 = objc_opt_class();
      v14 = objc_opt_class();
      v15 = objc_opt_class();
      v16 = objc_opt_class();
      objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, objc_opt_class(), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("CAFCarConfigurationPluginConfigs"));
      v18 = objc_claimAutoreleasedReturnValue();
      pluginConfigs = v5->_pluginConfigs;
      v5->_pluginConfigs = (NSDictionary *)v18;

    }
    v5->_rightHandDrive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CAFCarConfigurationRightHandDrive"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAFCarConfigurationSessionAnalytics"));
    v20 = objc_claimAutoreleasedReturnValue();
    sessionAnalytics = v5->_sessionAnalytics;
    v5->_sessionAnalytics = (CAFSessionAnalytics *)v20;

    v22 = -[CAFCachedDescription initWithCacheable:]([CAFCachedDescription alloc], "initWithCacheable:", v5);
    cachedDescription = v5->_cachedDescription;
    v5->_cachedDescription = v22;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  NSDictionary *pluginConfigs;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_name, CFSTR("CAFCarConfigurationNameKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_uniqueIdentifier, CFSTR("CAFCarConfigurationUniqueIdentifierKey"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_pluginCount);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("CAFCarConfigurationPluginCountKey"));

  pluginConfigs = self->_pluginConfigs;
  if (pluginConfigs)
    objc_msgSend(v6, "encodeObject:forKey:", pluginConfigs, CFSTR("CAFCarConfigurationPluginConfigs"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_rightHandDrive, CFSTR("CAFCarConfigurationRightHandDrive"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sessionAnalytics, CFSTR("CAFCarConfigurationSessionAnalytics"));

}

- (id)currentDescriptionForCache:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  -[CAFCarConfiguration name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFCarConfiguration uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFCarConfiguration pluginConfigs](self, "pluginConfigs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p name=%@ uniqueIdentifier=%@ pluginCount=%lu/%lu>"), v5, self, v6, v8, objc_msgSend(v9, "count"), -[CAFCarConfiguration pluginCount](self, "pluginCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (BOOL)rightHandDrive
{
  return self->_rightHandDrive;
}

- (unint64_t)pluginCount
{
  return self->_pluginCount;
}

- (NSDictionary)pluginConfigs
{
  return self->_pluginConfigs;
}

- (CAFCachedDescription)cachedDescription
{
  return self->_cachedDescription;
}

- (CAFSessionAnalytics)sessionAnalytics
{
  return self->_sessionAnalytics;
}

- (CAFCarConfigurationDelegate)delegate
{
  return (CAFCarConfigurationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionAnalytics, 0);
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_pluginConfigs, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __43__CAFCarConfiguration_updateConfiguration___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_237717000, log, OS_LOG_TYPE_ERROR, "Parsing configuration failed for pluginID", v1, 2u);
}

void __43__CAFCarConfiguration_updateConfiguration___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_237717000, a2, OS_LOG_TYPE_ERROR, "Parsing configuration from pluginID: %@ failed for pluginConfig", (uint8_t *)&v2, 0xCu);
}

@end
