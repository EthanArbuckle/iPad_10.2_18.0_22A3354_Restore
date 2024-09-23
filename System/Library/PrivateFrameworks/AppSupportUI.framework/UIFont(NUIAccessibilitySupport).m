@implementation UIFont(NUIAccessibilitySupport)

+ (uint64_t)_nui_isAccessibilityEnabled
{
  uint64_t v0;

  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "preferredContentSizeCategory");
  if (+[UIFont(NUIAccessibilitySupport) _nui_isAccessibilityEnabled]::onceToken != -1)
    dispatch_once(&+[UIFont(NUIAccessibilitySupport) _nui_isAccessibilityEnabled]::onceToken, &__block_literal_global_56);
  return objc_msgSend((id)+[UIFont(NUIAccessibilitySupport) _nui_isAccessibilityEnabled]::largeSizes, "containsObject:", v0);
}

@end
