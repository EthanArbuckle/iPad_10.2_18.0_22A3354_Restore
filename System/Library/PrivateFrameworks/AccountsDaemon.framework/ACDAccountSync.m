@implementation ACDAccountSync

+ (id)sharedAccountSyncServer
{
  NSObject *v2;

  _ACDLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    +[ACDAccountSync sharedAccountSyncServer].cold.1();

  return 0;
}

+ (id)accountSyncUnsupportedTypes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[15];

  v10[14] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDB4060];
  v10[0] = *MEMORY[0x24BDB3FE8];
  v10[1] = v2;
  v3 = *MEMORY[0x24BDB4020];
  v10[2] = *MEMORY[0x24BDB4080];
  v10[3] = v3;
  v4 = *MEMORY[0x24BDB4150];
  v10[4] = *MEMORY[0x24BDB40C8];
  v10[5] = v4;
  v5 = *MEMORY[0x24BDB4040];
  v10[6] = *MEMORY[0x24BDB4120];
  v10[7] = v5;
  v6 = *MEMORY[0x24BDB4158];
  v10[8] = *MEMORY[0x24BDB4058];
  v10[9] = v6;
  v7 = *MEMORY[0x24BDB4178];
  v10[10] = *MEMORY[0x24BDB4140];
  v10[11] = v7;
  v8 = *MEMORY[0x24BDB40E8];
  v10[12] = *MEMORY[0x24BDB4138];
  v10[13] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 14);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)accountSyncSupportedTypes
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (ACDAccountSync)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACDAccountSync;
  return -[ACDAccountSync init](&v3, sel_init);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ACDAccountSync;
  -[ACDAccountSync dealloc](&v4, sel_dealloc);
}

- (BOOL)checkCircleState
{
  self->_enabled = 0;
  return 0;
}

+ (id)accountSyncPropertiesForAccount:(id)a3
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

+ (void)sharedAccountSyncServer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"Account Sync - sharedAccountSyncServer is deprecated\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
