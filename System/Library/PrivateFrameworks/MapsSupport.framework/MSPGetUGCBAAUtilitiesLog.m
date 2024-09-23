@implementation MSPGetUGCBAAUtilitiesLog

void __MSPGetUGCBAAUtilitiesLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Maps.MSP", "UGCBAAUtilities");
  v1 = (void *)qword_1ED3283E8;
  qword_1ED3283E8 = (uint64_t)v0;

}

@end
