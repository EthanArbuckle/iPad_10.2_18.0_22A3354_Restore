@implementation GSWriteStackshot

void *___GSWriteStackshot_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 2);
  if (result)
    result = dlsym(result, "WriteStackshotReport_stdc");
  _GSWriteStackshot_dyfunc_WriteStackshotReport_stdc = (uint64_t (*)(_QWORD, _QWORD))result;
  return result;
}

@end
