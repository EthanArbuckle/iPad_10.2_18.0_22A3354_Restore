@implementation HUCameraEventReachabilityCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUCameraEventReachabilityCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUCameraEventReachabilityCell"), CFSTR("reachabilityEvent"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  -[HUCameraEventReachabilityCellAccessibility _axReachabilityEvent](self, "_axReachabilityEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE4D058];
  objc_msgSend(v5, "dateOfOccurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributedShortTimeStringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BE4D058];
  objc_msgSend(v5, "dateOfOccurrence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizerKeyDayNameFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateOfOccurrence");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v13);
  v15 = v14;

  if (v15 > 604800.0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Last%@"), v12);
    v16 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v16;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("HUCameraEventRecordingCellAccessibilityLabelSignificantEventTimeOn%@Format"), v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BDD17C8];
  accessibilityHomeUILocalizedString(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", v19, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUCameraEventReachabilityCellAccessibility _axReachabilityEvent](self, "_axReachabilityEvent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "duration");
  AXDurationStringForDuration();
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityHomeUILocalizedString(CFSTR("camera.clip.offline.event"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_axReachabilityEvent
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[HUCameraEventReachabilityCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("reachabilityEvent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
