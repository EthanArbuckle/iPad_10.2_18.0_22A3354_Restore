@implementation UIKeyboardInputMode(Staging_Compatibility)

- (uint64_t)safe__extendedDisplayName
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "extendedDisplayName");
  else
    return objc_msgSend(a1, "displayName");
}

@end
