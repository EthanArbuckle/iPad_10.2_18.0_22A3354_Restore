@implementation LTOSLogTextAPI

void ___LTOSLogTextAPI_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Translation", "TextAPI");
  v1 = (void *)_LTOSLogTextAPI_log;
  _LTOSLogTextAPI_log = (uint64_t)v0;

}

@end
