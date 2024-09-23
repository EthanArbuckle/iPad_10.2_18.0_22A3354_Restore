@implementation _EXExtensionIdentity(Overlay)

- (void)xpcOverlayDictionaryOverridingSandboxProfileName:()Overlay multiInstance:arguments:additionalEnvironment:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = "sandboxProfileName";
  v3 = 2080;
  v1 = 136315650;
  v4 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/EXExtensionIdentity.m";
  v5 = 1024;
  v6 = 908;
  _os_log_fault_impl(&dword_190C25000, log, OS_LOG_TYPE_FAULT, "%s - %s:%d: Sandbox profile name required", (uint8_t *)&v1, 0x1Cu);
}

- (void)xpcOverlayDictionaryOverridingSandboxProfileName:()Overlay multiInstance:arguments:additionalEnvironment:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_190C25000, v0, v1, "%@ XPC overlay: %@");
  OUTLINED_FUNCTION_6();
}

- (void)xpcOverlayDictionaryOverridingSandboxProfileName:()Overlay multiInstance:arguments:additionalEnvironment:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6();
}

- (void)xpcOverlayDictionaryOverridingSandboxProfileName:()Overlay multiInstance:arguments:additionalEnvironment:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6();
}

- (void)xpcOverlayDictionaryOverridingSandboxProfileName:()Overlay multiInstance:arguments:additionalEnvironment:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6();
}

- (void)_executableURLWithError:()Overlay .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_190C25000, log, OS_LOG_TYPE_ERROR, "failed to obtain execPath", v1, 2u);
}

@end
