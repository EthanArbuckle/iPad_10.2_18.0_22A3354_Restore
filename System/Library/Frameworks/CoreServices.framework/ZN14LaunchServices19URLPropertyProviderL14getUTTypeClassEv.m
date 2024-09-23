@implementation ZN14LaunchServices19URLPropertyProviderL14getUTTypeClassEv

void *___ZN14LaunchServices19URLPropertyProviderL14getUTTypeClassEv_block_invoke()
{
  void *result;

  result = objc_getClass("UTType");
  LaunchServices::URLPropertyProvider::getUTTypeClass(void)::result = (uint64_t)result;
  if (!result)
  {
    if (UniformTypeIdentifiersLibrary(void)::frameworkLibrary
      || (result = dlopen("/System/Library/Frameworks/UniformTypeIdentifiers.framework/UniformTypeIdentifiers", 2),
          (UniformTypeIdentifiersLibrary(void)::frameworkLibrary = (uint64_t)result) != 0))
    {
      result = objc_getClass("UTType");
      LaunchServices::URLPropertyProvider::getUTTypeClass(void)::result = (uint64_t)result;
    }
  }
  return result;
}

@end
