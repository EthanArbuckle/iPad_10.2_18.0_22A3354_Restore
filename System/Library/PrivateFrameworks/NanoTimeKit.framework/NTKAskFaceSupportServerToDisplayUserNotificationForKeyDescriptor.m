@implementation NTKAskFaceSupportServerToDisplayUserNotificationForKeyDescriptor

void __NTKAskFaceSupportServerToDisplayUserNotificationForKeyDescriptor_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __NTKAskFaceSupportServerToDisplayUserNotificationForKeyDescriptor_block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __NTKAskFaceSupportServerToDisplayUserNotificationForKeyDescriptor_block_invoke_105(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __NTKAskFaceSupportServerToDisplayUserNotificationForKeyDescriptor_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Key descriptor list attempt failed with error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
