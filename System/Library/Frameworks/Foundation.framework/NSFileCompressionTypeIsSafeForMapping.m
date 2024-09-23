@implementation NSFileCompressionTypeIsSafeForMapping

void *___NSFileCompressionTypeIsSafeForMapping_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AppleFSCompression.framework/AppleFSCompression", 256);
  if (result)
  {
    result = dlsym(result, "queryCompressionInfo");
    _MergedGlobals_145 = (uint64_t (*)(_QWORD, _QWORD))result;
  }
  return result;
}

@end
