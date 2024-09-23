@implementation NSFileManager

uint64_t __104__NSFileManager_HealthKit__hk_enumerateDirectoryAtURL_includingPropertiesForKeys_options_error_handler___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 0;
}

uint64_t __104__NSFileManager_HealthKit__hk_enumerateDirectoryAtURL_includingPropertiesForKeys_options_error_handler___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return 1;
}

@end
