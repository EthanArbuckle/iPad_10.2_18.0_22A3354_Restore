@implementation _SBSystemApertureIndicatorContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SBSystemApertureIndicatorContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSensorActivityDataProvider"), CFSTR("activeSensorActivityAttributions"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSystemApertureViewController"), CFSTR("_orderedContainerViews"), "NSMutableArray");

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[_SBSystemApertureIndicatorContainerViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
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
    v17.super_class = (Class)_SBSystemApertureIndicatorContainerViewAccessibility;
    -[_SBSystemApertureIndicatorContainerViewAccessibility accessibilityLabel](&v17, sel_accessibilityLabel);
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

- (id)accessibilityPath
{
  void *v3;
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  -[_SBSystemApertureIndicatorContainerViewAccessibility _accessibilityContainerView](self, "_accessibilityContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityFrame");
    x = v25.origin.x;
    y = v25.origin.y;
    width = v25.size.width;
    height = v25.size.height;
    v26 = CGRectInset(v25, -5.0, -5.0);
    v21 = v26.size.height;
    v9 = v26.origin.x;
    v23 = v26.origin.x;
    v10 = v26.origin.y;
    v11 = v26.size.width;
    v12 = CGRectGetWidth(v26);
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v22 = v12 / CGRectGetWidth(v27);
    v28.origin.x = v9;
    v28.origin.y = v10;
    v28.size.width = v11;
    v28.size.height = v21;
    v13 = CGRectGetHeight(v28);
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v14 = v13 / CGRectGetHeight(v29);
    objc_msgSend(v4, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cornerRadius");
    v17 = fmax(v22, v14) * v16;

    objc_msgSend(MEMORY[0x24BDF6870], "_bezierPathWithArcRoundedRect:cornerRadius:", v23, v10, v11, v21, v17);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)_SBSystemApertureIndicatorContainerViewAccessibility;
    -[_SBSystemApertureIndicatorContainerViewAccessibility accessibilityPath](&v24, sel_accessibilityPath);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;

  return v19;
}

- (id)_accessibilityContainerView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("systemApertureControllerForMainDisplay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("_systemApertureViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeArrayForKey:", CFSTR("_orderedContainerViews"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
