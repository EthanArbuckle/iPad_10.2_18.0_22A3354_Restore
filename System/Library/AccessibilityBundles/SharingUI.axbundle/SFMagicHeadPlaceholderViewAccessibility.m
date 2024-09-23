@implementation SFMagicHeadPlaceholderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFMagicHeadPlaceholderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFMagicHeadPlaceholderView"), CFSTR("setTiltedTooFarColor:useRaiseLabel:useNoUWBCapableLabel:"), "v", "B", "B", "B", 0);
}

- (void)setTiltedTooFarColor:(BOOL)a3 useRaiseLabel:(BOOL)a4 useNoUWBCapableLabel:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  char v9;
  int v10;
  double Current;
  void *v12;
  void *v13;
  int v14;
  int v15;
  objc_super v16;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v9 = -[SFMagicHeadPlaceholderViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_useRaiseLabel"));
  v10 = -[SFMagicHeadPlaceholderViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_useNoUWBCapableLabel"));
  v16.receiver = self;
  v16.super_class = (Class)SFMagicHeadPlaceholderViewAccessibility;
  -[SFMagicHeadPlaceholderViewAccessibility setTiltedTooFarColor:useRaiseLabel:useNoUWBCapableLabel:](&v16, sel_setTiltedTooFarColor_useRaiseLabel_useNoUWBCapableLabel_, v7, v6, v5);
  Current = CFAbsoluteTimeGetCurrent();
  -[SFMagicHeadPlaceholderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_label"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessibilityLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (v9 & 1) == 0 && v6 || v5 & ~v10;
  if (v6 && Current - *(double *)&setTiltedTooFarColor_useRaiseLabel_useNoUWBCapableLabel__LastAnnouncementTime > 4.0)
    v15 = objc_msgSend(v13, "isEqualToString:", setTiltedTooFarColor_useRaiseLabel_useNoUWBCapableLabel__LastAnnouncementString, Current - *(double *)&setTiltedTooFarColor_useRaiseLabel_useNoUWBCapableLabel__LastAnnouncementTime) ^ 1;
  else
    v15 = 0;
  if ((v14 | v15) == 1)
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v13);
    setTiltedTooFarColor_useRaiseLabel_useNoUWBCapableLabel__LastAnnouncementTime = *(_QWORD *)&Current;
    objc_storeStrong((id *)&setTiltedTooFarColor_useRaiseLabel_useNoUWBCapableLabel__LastAnnouncementString, v13);
  }

}

@end
