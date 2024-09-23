@implementation NSObject(CoreAX)

- (id)swiftui_accessibilityLabel
{
  void *v2;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "accessibilityLabel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)_swiftui_setAccessibilityLabel:()CoreAX
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a1, "setAccessibilityLabel:", v4);

}

@end
