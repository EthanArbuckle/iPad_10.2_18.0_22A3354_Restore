@implementation UIApplicationAccessibility

uint64_t __81__UIApplicationAccessibility__LoginUI__UIKit__accessibilitySoftwareMimicKeyboard__block_invoke()
{
  uint64_t result;

  _accessibilitySoftwareMimicKeyboard_LUIUserLoginPasswordViewController = MEMORY[0x2349129A8](CFSTR("LUIUserLoginPasswordViewController"));
  result = MEMORY[0x2349129A8](CFSTR("LUIPasscodeView"));
  _accessibilitySoftwareMimicKeyboard_LUIPasscodeView = result;
  return result;
}

uint64_t __81__UIApplicationAccessibility__LoginUI__UIKit__accessibilitySoftwareMimicKeyboard__block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __81__UIApplicationAccessibility__LoginUI__UIKit__accessibilitySoftwareMimicKeyboard__block_invoke_3()
{
  return objc_opt_isKindOfClass() & 1;
}

@end
