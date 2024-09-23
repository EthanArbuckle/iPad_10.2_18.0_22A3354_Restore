@implementation UITextRangeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITextRangeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("UITextRangeView");
  v3 = "UISelectionGrabber";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UITextRangeView"), CFSTR("m_endGrabber"), "UISelectionGrabber");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextRangeView"), CFSTR("updateGrabbers"), "v", 0);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  objc_super v4;
  SEL v5;
  UITextRangeViewAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)UITextRangeViewAccessibility;
  -[UITextRangeViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  v2 = (id)-[UITextRangeViewAccessibility safeUIViewForKey:](v6, "safeUIViewForKey:", CFSTR("m_startGrabber"));
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("TextSelectionStartGrabber"));

  v3 = (id)-[UITextRangeViewAccessibility safeUIViewForKey:](v6, "safeUIViewForKey:", CFSTR("m_endGrabber"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("TextSelectionEndGrabber"));

}

- (void)updateGrabbers
{
  objc_super v2;
  SEL v3;
  UITextRangeViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UITextRangeViewAccessibility;
  -[UITextRangeViewAccessibility updateGrabbers](&v2, sel_updateGrabbers);
  -[UITextRangeViewAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
}

- (id)automationElements
{
  void *v3;
  id v4;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDBCE30];
  v5 = (id)-[UITextRangeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("m_startGrabber"));
  v4 = (id)-[UITextRangeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("m_endGrabber"));
  v6 = (id)objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v5, v4);

  return v6;
}

@end
