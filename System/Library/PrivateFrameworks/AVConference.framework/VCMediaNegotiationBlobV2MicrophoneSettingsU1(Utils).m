@implementation VCMediaNegotiationBlobV2MicrophoneSettingsU1(Utils)

- (void)initWithSSRC:()Utils audioPayloads:u1AuthTagEnabled:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VCMediaNegotiationBlobV2MicrophoneSettingsU1(Utils) initWithSSRC:audioPayloads:u1AuthTagEnabled:]";
  v6 = 1024;
  v7 = 25;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d The payload set is empty", (uint8_t *)&v2, 0x1Cu);
}

- (void)initWithSSRC:()Utils audioPayloads:u1AuthTagEnabled:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = a1;
  v5 = 2080;
  v6 = "-[VCMediaNegotiationBlobV2MicrophoneSettingsU1(Utils) initWithSSRC:audioPayloads:u1AuthTagEnabled:]";
  v7 = 1024;
  v8 = 30;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d No payloads to negotiate. Audio payloads=%@", (uint8_t *)&v3, 0x26u);
}

@end
