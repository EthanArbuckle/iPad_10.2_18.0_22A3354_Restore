@implementation UIKeyboardSceneDelegateAccessibility

void __69__UIKeyboardSceneDelegateAccessibility_setInputViews_animationStyle___block_invoke(id *a1)
{
  id argument[3];

  argument[2] = a1;
  argument[1] = a1;
  argument[0] = (id)objc_msgSend(a1[4], "safeValueForKey:", CFSTR("inputView"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], argument[0]);
  else
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEEB0]);
  objc_storeStrong(argument, 0);
}

- (void)setInputViews:(id)a3 animationStyle:(id)a4
{
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(id *);
  void *v9;
  id v10;
  objc_super v11;
  id v12;
  id location[2];
  UIKeyboardSceneDelegateAccessibility *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11.receiver = v14;
  v11.super_class = (Class)UIKeyboardSceneDelegateAccessibility;
  -[UIKeyboardSceneDelegateAccessibility setInputViews:animationStyle:](&v11, sel_setInputViews_animationStyle_, location[0], v12);
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __69__UIKeyboardSceneDelegateAccessibility_setInputViews_animationStyle___block_invoke;
  v9 = &unk_24FF3DA40;
  v10 = location[0];
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboardSceneDelegate");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  const char *v5;
  id v6;
  id *v7;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = "@";
  v3 = CFSTR("UIKeyboardSceneDelegate");
  v4 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("orderOutWithAnimationStyle:"), v4, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("orderInWithAnimationStyle:"), v4, v5, 0);
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", CFSTR("UIInputViewAnimationStyle"), CFSTR("duration"), "d");
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", CFSTR("UIInputViewSet"), CFSTR("inputView"), v5);
  objc_storeStrong(v7, v6);
}

- (void)orderInWithAnimationStyle:(id)a3
{
  float v3;
  UIKeyboardSceneDelegateAccessibility *v4;
  id v5;
  objc_super v6;
  id location[2];
  UIKeyboardSceneDelegateAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6.receiver = v8;
  v6.super_class = (Class)UIKeyboardSceneDelegateAccessibility;
  -[UIKeyboardSceneDelegateAccessibility orderInWithAnimationStyle:](&v6, sel_orderInWithAnimationStyle_, location[0]);
  v4 = v8;
  v5 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("duration"));
  objc_msgSend(v5, "floatValue");
  -[UIKeyboardSceneDelegateAccessibility performSelector:withObject:afterDelay:](v4, "performSelector:withObject:afterDelay:", sel__axPostScreenChange, 0, v3);

  objc_storeStrong(location, 0);
}

- (void)orderOutWithAnimationStyle:(id)a3
{
  objc_super v3;
  id location[2];
  UIKeyboardSceneDelegateAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIKeyboardSceneDelegateAccessibility;
  -[UIKeyboardSceneDelegateAccessibility orderOutWithAnimationStyle:](&v3, sel_orderOutWithAnimationStyle_, location[0]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(location, 0);
}

- (void)_axPostScreenChange
{
  unsigned int v2;

  v2 = MEMORY[0x2348C39C8]();
  MEMORY[0x2348C39BC](0);
  MEMORY[0x2348C39BC](v2);
}

@end
