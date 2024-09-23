@implementation SFMagicHeadWheelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFMagicHeadWheelView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (NSString)_axStatusText
{
  JUMPOUT(0x23491D948);
}

- (void)_axSetStatusText:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFMagicHeadWheelView"), CFSTR("selectedHead"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFMagicHeadWheelView"), CFSTR("centerOfContentBounds"), "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFMagicHeadWheelView"), CFSTR("radius"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFMagicHeadWheelView"), CFSTR("updateSelectedHead:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFMagicHeadWheelView"), CFSTR("pulseSelectedHead"), "v", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SFMagicHead"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFMagicHead"), CFSTR("node"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SFAirDropNode"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFAirDropNode"), CFSTR("displayNameForLocale:"), "@", "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFMagicHeadWheelViewAccessibility;
  return *MEMORY[0x24BDF7430] | -[SFMagicHeadWheelViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("placeholder.view.label"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v6;

  if (-[SFMagicHeadWheelViewAccessibility _axIsShowingHead](self, "_axIsShowingHead"))
  {
    -[SFMagicHeadWheelViewAccessibility _axDisplayNameForCurrentHead](self, "_axDisplayNameForCurrentHead");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMagicHeadWheelViewAccessibility _axStatusText](self, "_axStatusText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;

  if (-[SFMagicHeadWheelViewAccessibility _axIsShowingHead](self, "_axIsShowingHead"))
  {
    -[SFMagicHeadWheelViewAccessibility _axDisplayNameForCurrentHead](self, "_axDisplayNameForCurrentHead");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMagicHeadWheelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedHead"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("node"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "contactIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v8 = CFSTR("magic.head.share.person.hint");
    else
      v8 = CFSTR("magic.head.share.device.hint");
    accessibilityLocalizedString(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v9, v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (AXDeviceIsPad())
      v11 = CFSTR("magic.head.find.hint.ipad");
    else
      v11 = CFSTR("magic.head.find.hint.iphone");
    accessibilityLocalizedString(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)accessibilityPath
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[SFMagicHeadWheelViewAccessibility accessibilityFrame](self, "accessibilityFrame");
  AX_CGRectGetCenter();
  v4 = v3;
  v6 = v5;
  -[SFMagicHeadWheelViewAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("radius"));
  return (id)objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v6, v7 + -30.0, 0.0, 6.28318531);
}

- (BOOL)updateSelectedHead:(id)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFMagicHeadWheelViewAccessibility;
  v4 = -[SFMagicHeadWheelViewAccessibility updateSelectedHead:](&v6, sel_updateSelectedHead_, a3);
  if (v4)
    -[SFMagicHeadWheelViewAccessibility _axAnnounceCurrentHeadForce:](self, "_axAnnounceCurrentHeadForce:", 1);
  return v4;
}

- (void)pulseSelectedHead
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFMagicHeadWheelViewAccessibility;
  -[SFMagicHeadWheelViewAccessibility pulseSelectedHead](&v3, sel_pulseSelectedHead);
  -[SFMagicHeadWheelViewAccessibility _axAnnounceCurrentHeadForce:](self, "_axAnnounceCurrentHeadForce:", 0);
}

- (id)_axPlaceholderView
{
  return (id)-[SFMagicHeadWheelViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("placeHolderView"));
}

- (void)_axAnnounceCurrentHeadForce:(BOOL)a3
{
  double Current;
  uint64_t v6;
  id v7;

  Current = CFAbsoluteTimeGetCurrent();
  v6 = *(_QWORD *)&Current;
  if (a3 || Current - *(double *)&_axAnnounceCurrentHeadForce__LastAnnouncementTime > 4.0)
  {
    -[SFMagicHeadWheelViewAccessibility _axDisplayNameForCurrentHead](self, "_axDisplayNameForCurrentHead");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v7);
    _axAnnounceCurrentHeadForce__LastAnnouncementTime = v6;

  }
}

- (id)_axDisplayNameForCurrentHead
{
  void *v2;
  id v3;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  -[SFMagicHeadWheelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedHead"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("node"));
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __65__SFMagicHeadWheelViewAccessibility__axDisplayNameForCurrentHead__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayNameForLocale:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)_axIsShowingHead
{
  void *v3;
  int v4;
  BOOL v5;

  -[SFMagicHeadWheelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedHead"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SFMagicHeadWheelViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("inGuidanceStates")) ^ 1;
  if (v3)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

@end
