@implementation CSValidateStorageFile

os_log_t ___CSValidateStorageFile_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.chunkinglibrary", "default");
  CK_DEFAULT_LOG_INTERNAL_5 = (uint64_t)result;
  return result;
}

@end
