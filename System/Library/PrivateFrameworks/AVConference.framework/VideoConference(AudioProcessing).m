@implementation VideoConference(AudioProcessing)

- (void)updateSpeaking:()AudioProcessing timeStamp:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d STOP TALKING at %u", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)updateSpeaking:()AudioProcessing timeStamp:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d START TALKING at %u", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
