@implementation LoadAddressBookLegacy

void __LoadAddressBookLegacy_block_invoke()
{
  LoadAddressBookLegacy_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/AddressBookLegacy.framework/AddressBookLegacy", 1);
  if (!LoadAddressBookLegacy_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __LoadAddressBookLegacy_block_invoke_cold_1();
}

void __LoadAddressBookLegacy_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  OUTLINED_FUNCTION_0_2(&dword_1DD140000, MEMORY[0x1E0C81028], v0, "Failed to Soft Link: /System/Library/PrivateFrameworks/AddressBookLegacy.framework/AddressBookLegacy (%d)", v1, v2, v3, v4, 0);
}

@end
