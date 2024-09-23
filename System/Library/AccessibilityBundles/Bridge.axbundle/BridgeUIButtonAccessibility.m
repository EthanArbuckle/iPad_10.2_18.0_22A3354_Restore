@implementation BridgeUIButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BridgeUIButtonAccessibility;
  -[BridgeUIButtonAccessibility setImage:forState:](&v6, sel_setImage_forState_, a3, a4);
  objc_msgSend(MEMORY[0x24BDD17C8], "_accessibilityLastDrawnString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[BridgeUIButtonAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v5);
    objc_msgSend(MEMORY[0x24BDD17C8], "_accessibilitySetLastDrawnString:", 0);
  }

}

@end
