@implementation STUIStatusBarSensorActivityViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarSensorActivityView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  if (AXProcessIsSpringBoard())
  {
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("sensorActivityDataProvider"), "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSensorActivityDataProvider"), CFSTR("activeSensorActivityAttributions"), "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSensorActivityAttribution"), CFSTR("sensor"), "q", 0);
  }

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBB180];
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeValueForKey:", CFSTR("sensorActivityDataProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSetForKey:", CFSTR("activeSensorActivityAttributions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v6)
  {

LABEL_16:
    v17.receiver = self;
    v17.super_class = (Class)STUIStatusBarSensorActivityViewAccessibility;
    -[STUIStatusBarSensorActivityViewAccessibility accessibilityLabel](&v17, sel_accessibilityLabel);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  v7 = v6;
  LOBYTE(v8) = 0;
  LOBYTE(v9) = 0;
  v10 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      if (v8)
      {
        v8 = 1;
        if (!v9)
          goto LABEL_8;
      }
      else
      {
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "safeIntegerForKey:", CFSTR("sensor")) == 0;
        if (!v9)
        {
LABEL_8:
          v9 = objc_msgSend(v12, "safeIntegerForKey:", CFSTR("sensor")) == 1;
          continue;
        }
      }
      v9 = 1;
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v7);

  if (v8 && v9)
  {
    v13 = CFSTR("camera.mic.in.use");
    goto LABEL_21;
  }
  if (v8)
  {
    v13 = CFSTR("camera.in.use");
    goto LABEL_21;
  }
  if (!v9)
    goto LABEL_16;
  v13 = CFSTR("mic.in.use");
LABEL_21:
  accessibilityLocalizedString(v13);
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_22:
  v15 = (void *)v14;

  return v15;
}

@end
