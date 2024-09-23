@implementation BridgeNSStringAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSString");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)drawInRect:(CGRect)a3 withAttributes:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BridgeNSStringAccessibility;
  -[BridgeNSStringAccessibility drawInRect:withAttributes:](&v5, sel_drawInRect_withAttributes_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(MEMORY[0x24BDD17C8], "_accessibilitySetLastDrawnString:", self);
}

@end
