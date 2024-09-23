@implementation NSError

uint64_t __56__NSError_FSKitAdditions__fskit_initLocalizationStrings__block_invoke()
{
  return objc_msgSend(MEMORY[0x24BDD1540], "setUserInfoValueProviderForDomain:provider:", CFSTR("FSKitErrorDomain"), &__block_literal_global_17);
}

uint64_t __56__NSError_FSKitAdditions__fskit_initLocalizationStrings__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fskit_userInfoValueForKey:");
}

@end
