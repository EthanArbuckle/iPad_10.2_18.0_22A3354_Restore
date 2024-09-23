@implementation AXElementAttributedString

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AXElementAttributedString _accessibilityUnregister](self, "_accessibilityUnregister");
  v3.receiver = self;
  v3.super_class = (Class)AXElementAttributedString;
  -[AXAttributedString dealloc](&v3, sel_dealloc);
}

@end
