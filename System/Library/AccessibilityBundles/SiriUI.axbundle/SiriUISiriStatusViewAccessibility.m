@implementation SiriUISiriStatusViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriUISiriStatusView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriUISiriStatusView"), CFSTR("initWithFrame: screen: textInputEnabled: configuration:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriUISiriStatusView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriUISiriStatusView"), CFSTR("_touchInputView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriViewController"), CFSTR("_session"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriSession"), CFSTR("cancelSpeechRequest"), "v", 0);

}

- (SiriUISiriStatusViewAccessibility)initWithFrame:(CGRect)a3 screen:(id)a4 textInputEnabled:(BOOL)a5 configuration:(id)a6
{
  SiriUISiriStatusViewAccessibility *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SiriUISiriStatusViewAccessibility;
  v6 = -[SiriUISiriStatusViewAccessibility initWithFrame:screen:textInputEnabled:configuration:](&v10, sel_initWithFrame_screen_textInputEnabled_configuration_, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  accessibilityLocalizedString(CFSTR("listen.button.label"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUISiriStatusViewAccessibility setAccessibilityLabel:](v6, "setAccessibilityLabel:", v7);

  accessibilityLocalizedString(CFSTR("listen.button.hint.idle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUISiriStatusViewAccessibility setAccessibilityHint:](v6, "setAccessibilityHint:", v8);

  -[SiriUISiriStatusViewAccessibility setAccessibilityTraits:](v6, "setAccessibilityTraits:", *MEMORY[0x24BDF7408] | *MEMORY[0x24BDF73B0]);
  -[SiriUISiriStatusViewAccessibility setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", CFSTR("Listen"));
  _UIAccessibilityBlockPostingOfNotification();
  _UIAccessibilityBlockPostingOfNotification();
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB030], v6);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  _UIAccessibilityUnblockPostingOfNotification();
  _UIAccessibilityUnblockPostingOfNotification();
  UIAccessibilityPostNotification(0x1645u, 0);
  UIAccessibilityPostNotification(0x1647u, 0);
  v3.receiver = self;
  v3.super_class = (Class)SiriUISiriStatusViewAccessibility;
  -[SiriUISiriStatusViewAccessibility dealloc](&v3, sel_dealloc);
}

- (void)setMode:(int64_t)a3
{
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SiriUISiriStatusViewAccessibility;
  -[SiriUISiriStatusViewAccessibility setMode:](&v9, sel_setMode_);
  if (a3 == 1)
  {
    _UIAccessibilityBlockPostingOfNotification();
    _UIAccessibilityBlockPostingOfNotification();
    UIAccessibilityPostNotification(*MEMORY[0x24BEBB030], self);
    -[SiriUISiriStatusViewAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", 0);
    -[SiriUISiriStatusViewAccessibility setAccessibilityHint:](self, "setAccessibilityHint:", 0);
    -[SiriUISiriStatusViewAccessibility setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("Listening"));
    -[SiriUISiriStatusViewAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", *MEMORY[0x24BDF73E0]);
  }
  else
  {
    accessibilityLocalizedString(CFSTR("listen.button.label"));
    if (a3 == 2)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriUISiriStatusViewAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v5);

      v6 = CFSTR("listen.button.hint.thinking");
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriUISiriStatusViewAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v7);

      v6 = CFSTR("listen.button.hint.idle");
    }
    accessibilityLocalizedString(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUISiriStatusViewAccessibility setAccessibilityHint:](self, "setAccessibilityHint:", v8);

    -[SiriUISiriStatusViewAccessibility setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("Listen"));
    -[SiriUISiriStatusViewAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", *MEMORY[0x24BDF7408] | *MEMORY[0x24BDF73B0]);
    _UIAccessibilityUnblockPostingOfNotification();
    _UIAccessibilityUnblockPostingOfNotification();
  }
  _AXIgnoreNextNotification();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SiriUISiriStatusViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_touchInputView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  return 1;
}

- (CGRect)_defaultFocusRegionFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SiriUISiriStatusViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_touchInputView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeCGRectForKey:", CFSTR("_defaultFocusRegionFrame"));
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SiriUISiriStatusViewAccessibility;
  return -[SiriUISiriStatusViewAccessibility _accessibilityMediaAnalysisOptions](&v3, sel__accessibilityMediaAnalysisOptions) & 0xFFFF7FFF;
}

- (BOOL)accessibilityPerformMagicTap
{
  id v2;
  void *v4;

  -[SiriUISiriStatusViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v4;
  AXPerformSafeBlock();

  return 1;
}

uint64_t __65__SiriUISiriStatusViewAccessibility_accessibilityPerformMagicTap__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "siriStatusViewWasTapped:", *(_QWORD *)(a1 + 40));
}

- (void)accessibilityElementDidLoseFocus
{
  if (_AXSVoiceOverTouchEnabled())
    AXPerformSafeBlock();
}

void __69__SiriUISiriStatusViewAccessibility_accessibilityElementDidLoseFocus__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  UIAccessibilityPostNotification(0x1645u, 0);
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("delegate"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("_session"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("VoiceOverCancelRequestInProgress"));
  objc_msgSend(v4, "stopRequestWithOptions:", 0);
  objc_msgSend(v3, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("VoiceOverCancelRequestInProgress"));

}

@end
