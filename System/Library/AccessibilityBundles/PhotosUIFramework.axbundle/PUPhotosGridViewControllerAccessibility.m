@implementation PUPhotosGridViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUPhotosGridViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axShouldMoveFocusToNavigationButton
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetShouldMoveFocusToNavigationButton:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotosGridViewController"), CFSTR("_configureAddPlaceholderCell: animated:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotosGridViewController"), CFSTR("updateNavigationBarAnimated:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotosGridViewController"), CFSTR("setEditing: animated:"), "v", "B", "B", 0);

}

- (void)_configureAddPlaceholderCell:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)PUPhotosGridViewControllerAccessibility;
  v5 = a3;
  -[PUPhotosGridViewControllerAccessibility _configureAddPlaceholderCell:animated:](&v6, sel__configureAddPlaceholderCell_animated_, v5, v4);
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("AddPhotoPlaceholder"), v6.receiver, v6.super_class);

}

- (void)updateNavigationBarAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPhotosGridViewControllerAccessibility;
  -[PUPhotosGridViewControllerAccessibility updateNavigationBarAnimated:](&v6, sel_updateNavigationBarAnimated_, a3);
  if (-[PUPhotosGridViewControllerAccessibility _axShouldMoveFocusToNavigationButton](self, "_axShouldMoveFocusToNavigationButton"))
  {
    -[PUPhotosGridViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("navigationItem"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("rightBarButtonItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v5);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  if (-[PUPhotosGridViewControllerAccessibility isEditing](self, "isEditing") != a3 && v4)
    -[PUPhotosGridViewControllerAccessibility _axSetShouldMoveFocusToNavigationButton:](self, "_axSetShouldMoveFocusToNavigationButton:", 1);
  v7.receiver = self;
  v7.super_class = (Class)PUPhotosGridViewControllerAccessibility;
  -[PUPhotosGridViewControllerAccessibility setEditing:animated:](&v7, sel_setEditing_animated_, v5, v4);
  -[PUPhotosGridViewControllerAccessibility _axSetShouldMoveFocusToNavigationButton:](self, "_axSetShouldMoveFocusToNavigationButton:", 0);
}

@end
