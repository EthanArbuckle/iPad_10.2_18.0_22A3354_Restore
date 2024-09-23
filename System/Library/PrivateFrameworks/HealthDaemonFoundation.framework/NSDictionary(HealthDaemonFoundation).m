@implementation NSDictionary(HealthDaemonFoundation)

+ (id)hd_dictionaryFromXPCObject:()HealthDaemonFoundation
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v7;

  v3 = a3;
  v4 = v3;
  if (v3 && MEMORY[0x212BD3CFC](v3) == MEMORY[0x24BDACFA0])
  {
    v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if (v5)
      goto LABEL_4;
    _HKInitializeLogging();
    v7 = *MEMORY[0x24BDD2FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_ERROR))
      +[NSDictionary(HealthDaemonFoundation) hd_dictionaryFromXPCObject:].cold.1(v7);
  }
  v5 = 0;
LABEL_4:

  return v5;
}

+ (void)hd_dictionaryFromXPCObject:()HealthDaemonFoundation .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_210F9A000, log, OS_LOG_TYPE_ERROR, "Failed to convert XPC dictionary to CF dictionary", v1, 2u);
}

@end
