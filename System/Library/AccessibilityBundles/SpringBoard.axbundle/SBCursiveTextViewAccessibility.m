@implementation SBCursiveTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBCursiveTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBCursiveTextView"), CFSTR("loadText:pointSize:"), "v", "@", "d", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)loadText:(id)a3 pointSize:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBCursiveTextViewAccessibility;
  v6 = a3;
  -[SBCursiveTextViewAccessibility loadText:pointSize:](&v14, sel_loadText_pointSize_, v6, a4);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_7;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v7, 0, 0, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (!v9)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("language"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCursiveTextViewAccessibility setAccessibilityLanguage:](self, "setAccessibilityLanguage:", v12);

LABEL_7:
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    goto LABEL_8;
  }
  v10 = v9;
  AXLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[SBCursiveTextViewAccessibility loadText:pointSize:].cold.1((uint64_t)v10, v11);

LABEL_8:
}

- (BOOL)_accessibilityOverridesInvisibility
{
  return 1;
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7430];
}

- (CGRect)accessibilityFrame
{
  SBCursiveTextViewAccessibility *v2;
  void *v3;
  double v4;
  CGFloat v5;
  void *v6;
  double v7;
  CGFloat v8;
  UIView *v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  v2 = self;
  -[SBCursiveTextViewAccessibility window](v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4 * 0.5 + -150.0;
  -[SBCursiveTextViewAccessibility window](v2, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  -[SBCursiveTextViewAccessibility window](v2, "window");
  v9 = (UIView *)objc_claimAutoreleasedReturnValue();

  v18.size.height = 300.0;
  v18.origin.x = 0.0;
  v18.origin.y = v5;
  v18.size.width = v8;
  v19 = UIAccessibilityConvertFrameToScreenCoordinates(v18, v9);
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;

  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)_accessibilityViewIsVisible
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCursiveTextViewAccessibility accessibilityLanguage](self, "accessibilityLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXNSLocalizedStringForLocale();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  void *v5;

  AXDeviceHasHomeButton();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCursiveTextViewAccessibility accessibilityLanguage](self, "accessibilityLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXNSLocalizedStringForLocale();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)loadText:(uint64_t)a1 pointSize:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_232A0A000, a2, OS_LOG_TYPE_ERROR, "Failed to create NSPropertyList: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
