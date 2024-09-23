@implementation EKEvent(EKEvent_Shared)

- (void)setIsJunk:()EKEvent_Shared shouldSave:.cold.1(char a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("junk");
  if ((a1 & 1) == 0)
    v3 = CFSTR("not junk");
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "Error saving event for reporting as %@. Error = %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_couldBeJunkCommon
{
  OUTLINED_FUNCTION_8(&dword_1A2318000, a2, a3, "(couldBeJunk) event is not junk [%@]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
