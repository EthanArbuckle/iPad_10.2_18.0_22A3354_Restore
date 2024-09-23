@implementation NTKAskFaceSupportServerToResetOnNextLaunch

void __NTKAskFaceSupportServerToResetOnNextLaunch_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __NTKAskFaceSupportServerToResetOnNextLaunch_block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

uint64_t __NTKAskFaceSupportServerToResetOnNextLaunch_block_invoke_102(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __NTKAskFaceSupportServerToResetOnNextLaunch_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Reset attempt failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
