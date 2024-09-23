@implementation NSURL

void __40__NSURL_UTIAdditions____is_coreTypesURL__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/System/Library/CoreServices/MobileCoreTypes.bundle"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__is_coreTypesURL_coreTypesURL;
  __is_coreTypesURL_coreTypesURL = v0;

}

void __80__NSURL_IconServicesInternalAdditions___is_unregisteredPersonlityFileExtensions__block_invoke()
{
  void *v0;

  v0 = (void *)_is_unregisteredPersonlityFileExtensions_personalityMap;
  _is_unregisteredPersonlityFileExtensions_personalityMap = MEMORY[0x1E0C9AA70];

}

uint64_t __55__NSURL_IconServicesInternalAdditions____is__isNetBoot__block_invoke()
{
  uint64_t result;
  size_t v1;
  int v2;
  int v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 0;
  *(_QWORD *)v3 = 0x2800000001;
  v1 = 4;
  result = sysctl(v3, 2u, &v2, &v1, 0, 0);
  __is__isNetBoot_result = v2 != 0;
  return result;
}

@end
