@implementation UICommand(SFBrowserKeyCommandExtras)

- (__CFString)sf_commandSource
{
  __CFString *v0;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v0 = CFSTR("keyboard shortcut");
  else
    v0 = CFSTR("context menu");
  return v0;
}

@end
