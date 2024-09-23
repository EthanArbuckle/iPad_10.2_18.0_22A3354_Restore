@implementation UIKeyboardEmojiDraggableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboardEmojiDraggableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (id)accessibilityLabel
{
  id v2;
  char v4;
  id v5;
  objc_super v6;
  id v7;
  id v8;
  char v9;
  id v10[2];
  UIKeyboardEmojiDraggableViewAccessibility *v11;
  id v12;

  v11 = self;
  v10[1] = (id)a2;
  v9 = 0;
  objc_opt_class();
  v8 = (id)__UIAccessibilityCastAsClass();
  v7 = v8;
  objc_storeStrong(&v8, 0);
  v10[0] = (id)objc_msgSend(v7, "text");

  v4 = 0;
  if (v10[0])
  {
    v2 = v10[0];
  }
  else
  {
    v6.receiver = v11;
    v6.super_class = (Class)UIKeyboardEmojiDraggableViewAccessibility;
    v5 = -[UIKeyboardEmojiDraggableViewAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
    v4 = 1;
    v2 = v5;
  }
  v12 = v2;
  if ((v4 & 1) != 0)

  objc_storeStrong(v10, 0);
  return v12;
}

@end
