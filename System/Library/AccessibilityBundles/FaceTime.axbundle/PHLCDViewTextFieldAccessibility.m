@implementation PHLCDViewTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHLCDViewTextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDFEA60];
  v6.receiver = self;
  v6.super_class = (Class)PHLCDViewTextFieldAccessibility;
  -[PHLCDViewTextFieldAccessibility accessibilityValue](&v6, sel_accessibilityValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axAttributedStringWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEC78]);
  return v4;
}

- (void)_accessibilityPaste
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDF6FF8], "keyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstResponder");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v3, "canPerformAction:withSender:", sel_paste_, 0))
  {
    objc_msgSend(v3, "paste:", 0);
  }

}

@end
