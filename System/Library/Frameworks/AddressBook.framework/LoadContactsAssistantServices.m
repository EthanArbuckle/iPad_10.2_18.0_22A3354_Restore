@implementation LoadContactsAssistantServices

void __LoadContactsAssistantServices_block_invoke()
{
  LoadContactsAssistantServices_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ContactsAssistantServices.framework/ContactsAssistantServices", 1);
  if (!LoadContactsAssistantServices_frameworkLibrary && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __LoadContactsAssistantServices_block_invoke_cold_1();
}

void __LoadContactsAssistantServices_block_invoke_cold_1()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_20A301000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/ContactsAssistantServices.framework/ContactsAssistantServices (%d)", (uint8_t *)v1, 8u);
}

@end
