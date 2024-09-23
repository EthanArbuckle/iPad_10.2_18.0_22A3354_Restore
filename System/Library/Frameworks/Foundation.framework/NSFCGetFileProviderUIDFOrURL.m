@implementation NSFCGetFileProviderUIDFOrURL

void *___NSFCGetFileProviderUIDFOrURL_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/FileProvider.framework/FileProvider", 256);
  if (result)
  {
    result = dlsym(result, "FPFetchDatalessFileResolverUIDAtURL");
    off_1ECD09458 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))result;
  }
  return result;
}

@end
