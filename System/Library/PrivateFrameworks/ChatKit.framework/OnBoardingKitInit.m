@implementation OnBoardingKitInit

uint64_t ___OnBoardingKitInit_block_invoke()
{
  uint64_t result;

  _CKOBWelcomeController = MEMORY[0x193FF3C18](CFSTR("OBWelcomeController"), CFSTR("OnBoardingKit"));
  _CKOBBoldTrayButton = MEMORY[0x193FF3C18](CFSTR("OBBoldTrayButton"), CFSTR("OnBoardingKit"));
  _CKOBLinkTrayButton = MEMORY[0x193FF3C18](CFSTR("OBLinkTrayButton"), CFSTR("OnBoardingKit"));
  result = MEMORY[0x193FF3C18](CFSTR("OBWelcomeFullCenterContentController"), CFSTR("OnboardingKit"));
  _CKOBWelcomeFullCenterContentController = result;
  return result;
}

@end
