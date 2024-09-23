@implementation LTOSLogRomanization

void ___LTOSLogRomanization_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Translation", "Romanization");
  v1 = (void *)_LTOSLogRomanization_log;
  _LTOSLogRomanization_log = (uint64_t)v0;

}

@end
