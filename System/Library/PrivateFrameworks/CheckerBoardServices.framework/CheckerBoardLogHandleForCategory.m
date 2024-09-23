@implementation CheckerBoardLogHandleForCategory

void __CheckerBoardLogHandleForCategory_block_invoke()
{
  char has_internal_content;
  uint64_t i;
  os_log_t v2;
  void *v3;
  Boolean keyExistsAndHasValidFormat;

  has_internal_content = os_variant_has_internal_content();
  CFPreferencesAppSynchronize(CFSTR("com.apple.CheckerBoard"));
  keyExistsAndHasValidFormat = 0;
  CheckerBoardLogHandleForCategory_loggingEnabled = CFPreferencesGetAppBooleanValue(CFSTR("Logging"), CFSTR("com.apple.CheckerBoard"), &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat)
    CheckerBoardLogHandleForCategory_loggingEnabled = has_internal_content;
  for (i = 0; i != 12; ++i)
  {
    v2 = os_log_create("com.apple.CheckerBoard", CheckerBoardLogHandleForCategory_categoryNames[i]);
    v3 = (void *)CheckerBoardLogHandleForCategory_logHandles[i];
    CheckerBoardLogHandleForCategory_logHandles[i] = (uint64_t)v2;

  }
}

@end
