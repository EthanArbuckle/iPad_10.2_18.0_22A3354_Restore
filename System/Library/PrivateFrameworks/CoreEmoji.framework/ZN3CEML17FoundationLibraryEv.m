@implementation ZN3CEML17FoundationLibraryEv

void *___ZN3CEML17FoundationLibraryEv_block_invoke()
{
  void *result;
  CEM *v1;

  result = dlopen("/System/Library/Frameworks/Foundation.framework/Foundation", 2);
  CEM::FoundationLibrary(void)::frameworkLibrary = (uint64_t)result;
  if (!result)
  {
    dlerror();
    v1 = (CEM *)abort_report_np();
    return (void *)CEM::initNSString(v1);
  }
  return result;
}

@end
