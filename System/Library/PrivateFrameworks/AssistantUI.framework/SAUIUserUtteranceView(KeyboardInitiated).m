@implementation SAUIUserUtteranceView(KeyboardInitiated)

- (void)setAfui_KeyboardInitiated:()KeyboardInitiated
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setProperty:forKey:", v2, CFSTR("SiriUserUtteranceKeyboardInitiated"));

}

- (uint64_t)afui_isKeyboardInitiated
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "propertyForKey:", CFSTR("SiriUserUtteranceKeyboardInitiated"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

@end
