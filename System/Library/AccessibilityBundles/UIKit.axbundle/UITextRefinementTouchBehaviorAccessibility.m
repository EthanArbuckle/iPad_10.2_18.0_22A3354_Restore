@implementation UITextRefinementTouchBehaviorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITextRefinementTouchBehavior");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  id v4;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  v4 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("UITextRefinementTouchBehavior");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "q", "@?", "@?", "@?", "q", "^B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v3, CFSTR("_activeSelectionMode"), "NSInteger");
  objc_storeStrong(v5, v4);
}

- (void)textLoupeInteraction:(id)a3 gestureChangedWithState:(int64_t)a4 location:(id)a5 translation:(id)a6 velocity:(id)a7 modifierFlags:(int64_t)a8 shouldCancel:(BOOL *)a9
{
  objc_super v14;
  BOOL *v15;
  int64_t v16;
  id v17;
  id v18;
  id v19;
  int64_t v20;
  id location[2];
  UITextRefinementTouchBehaviorAccessibility *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = a4;
  v19 = 0;
  objc_storeStrong(&v19, a5);
  v18 = 0;
  objc_storeStrong(&v18, a6);
  v17 = 0;
  objc_storeStrong(&v17, a7);
  v16 = a8;
  v15 = a9;
  v14.receiver = v22;
  v14.super_class = (Class)UITextRefinementTouchBehaviorAccessibility;
  -[UITextRefinementTouchBehaviorAccessibility textLoupeInteraction:gestureChangedWithState:location:translation:velocity:modifierFlags:shouldCancel:](&v14, sel_textLoupeInteraction_gestureChangedWithState_location_translation_velocity_modifierFlags_shouldCancel_, location[0], v20, v19, v18, v17, a8, a9);
  switch(v20)
  {
    case 1:
      UIAccessibilityPostNotification(0x43Au, 0);
      break;
    case 2:
      if (!-[UITextRefinementTouchBehaviorAccessibility safeIntegerForKey:](v22, "safeIntegerForKey:", CFSTR("_activeSelectionMode"))&& !(++textLoupeInteraction_gestureChangedWithState_location_translation_velocity_modifierFlags_shouldCancel__count% 3))
      {
        UIAccessibilityPostNotification(0x439u, 0);
        textLoupeInteraction_gestureChangedWithState_location_translation_velocity_modifierFlags_shouldCancel__count = 0;
      }
      break;
    case 3:
    case 4:
      UIAccessibilityPostNotification(0x43Bu, 0);
      break;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

@end
