@implementation SymptomReporterLibrary

void *__SymptomReporterLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SymptomReporter.framework/SymptomReporter", 2);
  SymptomReporterLibrary_sLib = (uint64_t)result;
  return result;
}

@end
