@implementation UserDetailsEditCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.UserDetailsEditCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.UserDetailsEditCell"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.UserDetailsEditCell"), CFSTR("nickname"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[UserDetailsEditCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("name, nickname"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UserDetailsEditCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[UserDetailsEditCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
