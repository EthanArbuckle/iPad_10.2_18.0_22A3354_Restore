@implementation CDPDLocalDeviceSecretProxyImpl

- (BOOL)hasLocalSecret
{
  void *v2;
  char v3;
  NSObject *v4;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeSet");
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[CDPDLocalDeviceSecretProxyImpl hasLocalSecret].cold.1((uint64_t)v2, v3, v4);

  return v3;
}

- (void)hasLocalSecret
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2 & 1;
  _os_log_debug_impl(&dword_20DB2C000, log, OS_LOG_TYPE_DEBUG, "\"Managed config (%@) reports isPasscodeSet=%i\", (uint8_t *)&v3, 0x12u);
}

@end
