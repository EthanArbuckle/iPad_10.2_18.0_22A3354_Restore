@implementation UIDictationLayoutViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIDictationLayoutView");
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
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIDictationLayoutView"), CFSTR("_keyboardButton"), "UIButton");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIDictationLayoutView"), CFSTR("_waveTapEndpointButtonView"), "UIView");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIDictationView"), CFSTR("_endpointButtonLandscape"), "UIButton");
  objc_storeStrong(location, 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  objc_super v24;
  SEL v25;
  UIDictationLayoutViewAccessibility *v26;

  v26 = self;
  v25 = a2;
  v24.receiver = self;
  v24.super_class = (Class)UIDictationLayoutViewAccessibility;
  -[UIDictationLayoutViewAccessibility _accessibilityLoadAccessibilityInformation](&v24, sel__accessibilityLoadAccessibilityInformation);
  v18 = (id)-[UIDictationLayoutViewAccessibility safeValueForKey:](v26, "safeValueForKey:", CFSTR("_globeButton"));
  v17 = accessibilityLocalizedString(CFSTR("dictate.globe.button"));
  objc_msgSend(v18, "setAccessibilityLabel:");

  v20 = (id)-[UIDictationLayoutViewAccessibility safeValueForKey:](v26, "safeValueForKey:", CFSTR("_keyboardButton"));
  v19 = accessibilityLocalizedString(CFSTR("dictate.keyboard.button"));
  objc_msgSend(v20, "setAccessibilityLabel:");

  if ((AXDeviceIsPhone() & 1) != 0)
  {
    v23 = (id)-[UIDictationLayoutViewAccessibility safeValueForKey:](v26, "safeValueForKey:", CFSTR("_endpointButton"));
    v22 = (id)-[UIDictationLayoutViewAccessibility safeValueForKey:](v26, "safeValueForKey:", CFSTR("_endpointButtonLandscape"));
    objc_msgSend(v23, "setIsAccessibilityElement:", 1);
    objc_msgSend(v23, "setAccessibilityRespondsToUserInteraction:", 1);
    v10 = (_QWORD *)MEMORY[0x24BDF73D0];
    v11 = (_QWORD *)MEMORY[0x24BEBB178];
    v12 = (_QWORD *)MEMORY[0x24BDF73B0];
    objc_msgSend(v23, "setAccessibilityTraits:", *MEMORY[0x24BDF73D0] | *MEMORY[0x24BEBB178] | *MEMORY[0x24BDF73B0]);
    v6 = v23;
    v7 = accessibilityLocalizedString(CFSTR("done.button"));
    objc_msgSend(v6, "setAccessibilityLabel:");

    v8 = v23;
    v9 = accessibilityLocalizedString(CFSTR("end.quietly.hint"));
    objc_msgSend(v8, "setAccessibilityHint:");

    objc_msgSend(v22, "setIsAccessibilityElement:", 1);
    objc_msgSend(v22, "setAccessibilityRespondsToUserInteraction:", 1);
    objc_msgSend(v22, "setAccessibilityTraits:", *v10 | *v11 | *v12);
    v13 = v22;
    v14 = accessibilityLocalizedString(CFSTR("done.button"));
    objc_msgSend(v13, "setAccessibilityLabel:");

    v15 = v22;
    v16 = accessibilityLocalizedString(CFSTR("end.quietly.hint"));
    objc_msgSend(v15, "setAccessibilityHint:");

    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
  }
  v21 = (id)-[UIDictationLayoutViewAccessibility safeValueForKey:](v26, "safeValueForKey:", CFSTR("_waveTapEndpointButtonView"));
  objc_msgSend(v21, "setIsAccessibilityElement:", 1);
  objc_msgSend(v21, "setAccessibilityRespondsToUserInteraction:", 0);
  v2 = v21;
  v3 = accessibilityLocalizedString(CFSTR("dictation.key"));
  objc_msgSend(v2, "setAccessibilityLabel:");

  v4 = v21;
  v5 = accessibilityLocalizedString(CFSTR("dictation.key.hint"));
  objc_msgSend(v4, "setAccessibilityHint:");

  objc_storeStrong(&v21, 0);
}

- (UIDictationLayoutViewAccessibility)initWithFrame:(CGRect)a3
{
  UIDictationLayoutViewAccessibility *v4;
  objc_super v5;
  id v6[2];
  UIDictationLayoutViewAccessibility *v7;
  CGRect v8;

  v8 = a3;
  v6[1] = (id)a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)UIDictationLayoutViewAccessibility;
  v7 = -[UIDictationLayoutViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6[0] = v7;
  objc_msgSend(v6[0], "_accessibilityLoadAccessibilityInformation");
  v4 = (UIDictationLayoutViewAccessibility *)v6[0];
  objc_storeStrong(v6, 0);
  objc_storeStrong((id *)&v7, 0);
  return v4;
}

@end
