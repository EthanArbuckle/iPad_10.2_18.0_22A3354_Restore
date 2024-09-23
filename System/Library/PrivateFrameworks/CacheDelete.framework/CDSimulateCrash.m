@implementation CDSimulateCrash

void *__CDSimulateCrash_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 1);
  qword_1ECE24280 = (uint64_t)result;
  return result;
}

@end
