@implementation ACDLogAccessRequest

void *__ACDLogAccessRequest_block_invoke()
{
  void *v0;
  void *result;

  v0 = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 2);
  result = dlsym(v0, "CRLogStructuredData");
  ACDLogAccessRequest__loadedCRLogStructuredData = (uint64_t (*)(_QWORD, _QWORD))result;
  return result;
}

@end
