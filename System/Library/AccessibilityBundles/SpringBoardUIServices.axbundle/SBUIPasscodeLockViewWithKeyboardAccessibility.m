@implementation SBUIPasscodeLockViewWithKeyboardAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUIPasscodeLockViewWithKeyboard");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIPasscodeLockViewWithKeyboard"), CFSTR("updateStatusText: subtitle: animated:"), "v", "@", "@", "B", 0);
}

- (void)updateStatusText:(id)a3 subtitle:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  objc_super v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[SBUIPasscodeLockViewWithKeyboardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_statusField"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isEqualToString:", v8) & 1) == 0)
  {
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(MEMORY[0x24BE006F0], "server");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isSystemSleeping");

      if ((v13 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setAttribute:forKey:", &unk_250393D08, *MEMORY[0x24BDFEAD8]);
        UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v14);

      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SBUIPasscodeLockViewWithKeyboardAccessibility;
  -[SBUIPasscodeLockViewWithKeyboardAccessibility updateStatusText:subtitle:animated:](&v15, sel_updateStatusText_subtitle_animated_, v8, v9, v5);

}

@end
