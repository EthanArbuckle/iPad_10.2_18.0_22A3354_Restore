@implementation MDMAbstractTunnelParser(Commands)

- (void)_commandDisconnect:()Commands .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = "/Library/Caches/com.apple.xbs/Sources/DeviceManagementClientTools/DeviceManagementClientTools/MDM Framework/Parse"
       "rs/MDMAbstractTunnelParser.m";
  v3 = 2080;
  v1 = 136315650;
  v4 = "-[MDMAbstractTunnelParser(Commands) _commandDisconnect:]";
  v5 = 2048;
  v6 = 43;
  _os_log_debug_impl(&dword_222CB9000, log, OS_LOG_TYPE_DEBUG, "<%s %s:%lu>", (uint8_t *)&v1, 0x20u);
}

@end
