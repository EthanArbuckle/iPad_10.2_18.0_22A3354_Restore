@implementation HUCameraEventRecordingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUCameraEventRecordingCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  return accessibilityHomeUILocalizedString(CFSTR("camera.clip.scrub.to.start"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[HUCameraEventRecordingCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("recordingEvent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "duration");
  AXDurationStringForDuration();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityCustomActions
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityHomeUILocalizedString(CFSTR("scrubber.timescale.toggle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithName:actionHandler:", v3, &__block_literal_global_3);
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __69__HUCameraEventRecordingCellAccessibility_accessibilityCustomActions__block_invoke()
{
  void *v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", AXToggleClipTimescaleNotification, 0);

  return 1;
}

- (id)_axStringForSignificantEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  objc_opt_class();
  -[HUCameraEventRecordingCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("recordingEvent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "hf_sortedSignificantEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = (id)objc_msgSend(&stru_2502359A8, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__HUCameraEventRecordingCellAccessibility__axStringForSignificantEvents__block_invoke;
  v10[3] = &unk_250234718;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __72__HUCameraEventRecordingCellAccessibility__axStringForSignificantEvents__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v5 = a2;
  v29 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendString:", CFSTR(", "));
    v5 = v29;
  }
  v6 = (void *)MEMORY[0x24BE4D058];
  objc_msgSend(v5, "dateOfOccurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributedShortTimeStringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BE4D058];
  objc_msgSend(v29, "dateOfOccurrence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizerKeyDayNameFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(void **)(a1 + 32);
  objc_msgSend(v29, "dateOfOccurrence");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v14);
  v16 = v15;

  if (v16 > 604800.0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Last%@"), v12);
    v17 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v17;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("HUCameraEventRecordingCellAccessibilityLabelSignificantEventTimeOn%@Format"), v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDD17C8];
  accessibilityHomeUILocalizedString(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", v20, v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "hf_faceClassificationName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    accessibilityHomeUILocalizedString(CFSTR("HFCameraSignificantEventReasonFamiliarFace"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "appendFormat:", v24, v22, v21);
  }
  else
  {
    v25 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v29, "hf_reasonKey");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("HFCameraSignificantEventReason%@"), v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    accessibilityHomeUILocalizedString(v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "appendFormat:", v28, v21);

  }
}

@end
