@implementation NSSoftLinkFileProvider

void *___NSSoftLinkFileProvider_block_invoke()
{
  void *result;
  void *v1;

  result = dlopen("/System/Library/Frameworks/FileProvider.framework/FileProvider", 256);
  if (result)
  {
    v1 = result;
    off_1ECD09800 = (uint64_t (*)(_QWORD, _QWORD))dlsym(result, "FPFileProviderMessageInterfacesForItemAtURL");
    off_1ECD09818 = (uint64_t (*)(_QWORD, _QWORD))dlsym(v1, "FPFileProviderFetchProxyFactoryEndpointForMessageInterface");
    off_1ECD09808 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))dlsym(v1, "FPFetchServiceEndpointCreatorForItemAtURL");
    off_1ECD09810 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))dlsym(v1, "FPFetchServiceEndpointCreatorByNameForItemAtURL");
    off_1ECD097A8 = (uint64_t (*)(_QWORD, _QWORD))dlsym(v1, "FPStartDownloadingItemAtURL");
    result = dlsym(v1, "FPEvictItemAtURL");
    off_1ECD097C0 = (uint64_t (*)(_QWORD, _QWORD))result;
  }
  return result;
}

@end
