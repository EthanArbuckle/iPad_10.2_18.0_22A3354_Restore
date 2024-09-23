@implementation AAUIProfilePhotoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AAUIProfilePhotoView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AAUIProfilePhotoView"), CFSTR("_editButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AAUIProfilePhotoView"), CFSTR("_photoView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AAUIProfilePhotoView"), CFSTR("isEditing"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[AAUIProfilePhotoViewAccessibility _accessibilityPhotoView](self, "_accessibilityPhotoView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;

  if (-[AAUIProfilePhotoViewAccessibility _accessibilityIsEditing](self, "_accessibilityIsEditing"))
  {
    accessibilityLocalizedString(CFSTR("editablePhoto.hint"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AAUIProfilePhotoViewAccessibility _accessibilityPhotoView](self, "_accessibilityPhotoView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityHint");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  _BOOL4 v2;
  uint64_t v3;

  v2 = -[AAUIProfilePhotoViewAccessibility _accessibilityIsEditing](self, "_accessibilityIsEditing");
  v3 = *MEMORY[0x24BDF73B0];
  if (!v2)
    v3 = 0;
  return v3 | *MEMORY[0x24BDF73C8];
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[AAUIProfilePhotoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_editButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (BOOL)_accessibilityIsEditing
{
  return -[AAUIProfilePhotoViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEditing"));
}

- (id)_accessibilityPhotoView
{
  return (id)-[AAUIProfilePhotoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_photoView"));
}

@end
