@implementation WriteStackshot

void *____WriteStackshot_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 1);
  if (result)
  {
    result = dlsym(result, "WriteStackshotReport");
    __WriteStackshot_PHWriteStackshotReport = (uint64_t (*)(_QWORD, _QWORD))result;
  }
  return result;
}

@end
