@implementation SBRecordingIndicatorViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBRecordingIndicatorViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRecordingIndicatorViewController"), CFSTR("indicatorView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRecordingIndicatorViewController"), CFSTR("initForLocation:windowScene:"), "@", "Q", "@", 0);

}

- (id)initForLocation:(unint64_t)a3 windowScene:(id)a4
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBRecordingIndicatorViewControllerAccessibility;
  v4 = -[SBRecordingIndicatorViewControllerAccessibility initForLocation:windowScene:](&v6, sel_initForLocation_windowScene_, a3, a4);
  objc_msgSend(v4, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBRecordingIndicatorViewControllerAccessibility;
  -[SBRecordingIndicatorViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SBRecordingIndicatorViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("indicatorView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetOverridesInvisibility:", 1);
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BEBB180]);
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", &__block_literal_global_16);

}

id __93__SBRecordingIndicatorViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  uint64_t v6;
  void *i;
  void *v8;
  __CFString *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeValueForKey:", CFSTR("sensorActivityDataProvider"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeSetForKey:", CFSTR("activeSensorActivityAttributions"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = v1;
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v3)
  {

    goto LABEL_21;
  }
  LOBYTE(v4) = 0;
  LOBYTE(v5) = 0;
  v6 = *(_QWORD *)v12;
  do
  {
    for (i = 0; i != v3; i = (char *)i + 1)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(v2);
      v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
      if (v4)
      {
        v4 = 1;
        if (!v5)
          goto LABEL_8;
      }
      else
      {
        v4 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "safeIntegerForKey:", CFSTR("sensor"), (_QWORD)v11) == 0;
        if (!v5)
        {
LABEL_8:
          v5 = objc_msgSend(v8, "safeIntegerForKey:", CFSTR("sensor"), (_QWORD)v11) == 1;
          continue;
        }
      }
      v5 = 1;
    }
    v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  }
  while (v3);

  if (v4 && v5)
  {
    v9 = CFSTR("camera.mic.in.use");
    goto LABEL_20;
  }
  if (v4)
  {
    v9 = CFSTR("camera.in.use");
    goto LABEL_20;
  }
  if (v5)
  {
    v9 = CFSTR("mic.in.use");
LABEL_20:
    accessibilityLocalizedString(v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
LABEL_21:

  return v3;
}

@end
