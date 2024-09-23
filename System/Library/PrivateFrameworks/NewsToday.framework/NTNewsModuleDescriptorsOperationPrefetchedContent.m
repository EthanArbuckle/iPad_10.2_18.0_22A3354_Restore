@implementation NTNewsModuleDescriptorsOperationPrefetchedContent

- (NTNewsModuleDescriptorsOperationPrefetchedContent)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTNewsModuleDescriptorsOperationPrefetchedContent init]";
    v9 = 2080;
    v10 = "NTNewsModuleDescriptorsOperation.m";
    v11 = 1024;
    v12 = 44;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTNewsModuleDescriptorsOperationPrefetchedContent init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTNewsModuleDescriptorsOperationPrefetchedContent)initWithAppConfiguration:(id)a3 privateData:(id)a4 todayConfigsByRequestID:(id)a5 prefetchedHeldRecordsByType:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NTNewsModuleDescriptorsOperationPrefetchedContent *v14;
  uint64_t v15;
  FCNewsAppConfiguration *appConfiguration;
  uint64_t v17;
  FCTodayPrivateData *privateData;
  uint64_t v19;
  NSDictionary *todayConfigsByRequestID;
  uint64_t v21;
  NSDictionary *prefetchedHeldRecordsByType;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTNewsModuleDescriptorsOperationPrefetchedContent initWithAppConfiguration:privateData:todayConfigsByRequestID:prefetchedHeldRecordsByType:].cold.3();
    if (v12)
      goto LABEL_6;
  }
  else if (v12)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsModuleDescriptorsOperationPrefetchedContent initWithAppConfiguration:privateData:todayConfigsByRequestID:prefetchedHeldRecordsByType:].cold.2();
LABEL_6:
  if (!v13 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsModuleDescriptorsOperationPrefetchedContent initWithAppConfiguration:privateData:todayConfigsByRequestID:prefetchedHeldRecordsByType:].cold.1();
  v24.receiver = self;
  v24.super_class = (Class)NTNewsModuleDescriptorsOperationPrefetchedContent;
  v14 = -[NTNewsModuleDescriptorsOperationPrefetchedContent init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    appConfiguration = v14->_appConfiguration;
    v14->_appConfiguration = (FCNewsAppConfiguration *)v15;

    v17 = objc_msgSend(v11, "copy");
    privateData = v14->_privateData;
    v14->_privateData = (FCTodayPrivateData *)v17;

    v19 = objc_msgSend(v12, "copy");
    todayConfigsByRequestID = v14->_todayConfigsByRequestID;
    v14->_todayConfigsByRequestID = (NSDictionary *)v19;

    v21 = objc_msgSend(v13, "copy");
    prefetchedHeldRecordsByType = v14->_prefetchedHeldRecordsByType;
    v14->_prefetchedHeldRecordsByType = (NSDictionary *)v21;

  }
  return v14;
}

- (FCNewsAppConfiguration)appConfiguration
{
  return self->_appConfiguration;
}

- (FCTodayPrivateData)privateData
{
  return self->_privateData;
}

- (NSDictionary)todayConfigsByRequestID
{
  return self->_todayConfigsByRequestID;
}

- (NSDictionary)prefetchedHeldRecordsByType
{
  return self->_prefetchedHeldRecordsByType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchedHeldRecordsByType, 0);
  objc_storeStrong((id *)&self->_todayConfigsByRequestID, 0);
  objc_storeStrong((id *)&self->_privateData, 0);
  objc_storeStrong((id *)&self->_appConfiguration, 0);
}

- (void)initWithAppConfiguration:privateData:todayConfigsByRequestID:prefetchedHeldRecordsByType:.cold.1()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "prefetchedHeldRecordsByType");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_2();
}

- (void)initWithAppConfiguration:privateData:todayConfigsByRequestID:prefetchedHeldRecordsByType:.cold.2()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "todayConfigsByRequestID");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_2();
}

- (void)initWithAppConfiguration:privateData:todayConfigsByRequestID:prefetchedHeldRecordsByType:.cold.3()
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "appConfiguration");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_2();
}

@end
