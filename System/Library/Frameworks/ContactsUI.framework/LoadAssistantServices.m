@implementation LoadAssistantServices

void __LoadAssistantServices_block_invoke()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  LoadAssistantServices_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/AssistantServices.framework/AssistantServices", 1);
  if (!LoadAssistantServices_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = *__error();
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_error_impl(&dword_18AC56000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/AssistantServices.framework/AssistantServices (%d)", (uint8_t *)v1, 8u);
  }
}

void __LoadAssistantServices_block_invoke_38076()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  LoadAssistantServices_frameworkLibrary_38078 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/AssistantServices.framework/AssistantServices", 1);
  if (!LoadAssistantServices_frameworkLibrary_38078 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = *__error();
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_error_impl(&dword_18AC56000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/AssistantServices.framework/AssistantServices (%d)", (uint8_t *)v1, 8u);
  }
}

void __LoadAssistantServices_block_invoke_43388()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  LoadAssistantServices_frameworkLibrary_43390 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/AssistantServices.framework/AssistantServices", 1);
  if (!LoadAssistantServices_frameworkLibrary_43390 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = *__error();
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_error_impl(&dword_18AC56000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/AssistantServices.framework/AssistantServices (%d)", (uint8_t *)v1, 8u);
  }
}

void __LoadAssistantServices_block_invoke_46051()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  LoadAssistantServices_frameworkLibrary_46053 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/AssistantServices.framework/AssistantServices", 1);
  if (!LoadAssistantServices_frameworkLibrary_46053 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = *__error();
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_error_impl(&dword_18AC56000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/AssistantServices.framework/AssistantServices (%d)", (uint8_t *)v1, 8u);
  }
}

void __LoadAssistantServices_block_invoke_51379()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  LoadAssistantServices_frameworkLibrary_51377 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/AssistantServices.framework/AssistantServices", 1);
  if (!LoadAssistantServices_frameworkLibrary_51377 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = *__error();
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_error_impl(&dword_18AC56000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/AssistantServices.framework/AssistantServices (%d)", (uint8_t *)v1, 8u);
  }
}

@end
