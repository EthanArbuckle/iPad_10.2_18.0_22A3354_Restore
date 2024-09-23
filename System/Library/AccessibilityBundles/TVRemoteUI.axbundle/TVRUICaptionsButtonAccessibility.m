@implementation TVRUICaptionsButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TVRUICaptionsButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVRUICaptionsButton"), CFSTR("captionsEnabled"), "B", 0);
}

- (unint64_t)accessibilityTraits
{
  objc_super v4;
  objc_super v5;

  if (-[TVRUICaptionsButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("captionsEnabled")))
  {
    v5.receiver = self;
    v5.super_class = (Class)TVRUICaptionsButtonAccessibility;
    return *MEMORY[0x24BDF7400] | -[TVRUICaptionsButtonAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)TVRUICaptionsButtonAccessibility;
    return -[TVRUICaptionsButtonAccessibility accessibilityTraits](&v4, sel_accessibilityTraits);
  }
}

@end
