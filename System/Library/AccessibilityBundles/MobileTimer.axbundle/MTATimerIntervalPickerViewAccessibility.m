@implementation MTATimerIntervalPickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTATimerIntervalPickerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("MTATimerIntervalPickerCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerIntervalPickerView"), CFSTR("pickerView:viewForRow:forComponent:reusingView:"), "@", "@", "q", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MTATimerIntervalPickerView"), CFSTR("_timePicker"), "UIPickerView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerIntervalPickerCell"), CFSTR("textLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerIntervalPickerView"), CFSTR("_hoursStringForHour:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerIntervalPickerView"), CFSTR("_minutesStringForMinutes:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerIntervalPickerView"), CFSTR("_secondsStringForSeconds:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MTATimerIntervalPickerView"), CFSTR("UIControl"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTATimerIntervalPickerViewAccessibility;
  -[MTATimerIntervalPickerViewAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)accessibilityElements
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[MTATimerIntervalPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_timePicker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  objc_super v32;

  v10 = a3;
  v11 = a6;
  v32.receiver = self;
  v32.super_class = (Class)MTATimerIntervalPickerViewAccessibility;
  -[MTATimerIntervalPickerViewAccessibility pickerView:viewForRow:forComponent:reusingView:](&v32, sel_pickerView_viewForRow_forComponent_reusingView_, v10, a4, a5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234916758](CFSTR("MTATimerIntervalPickerCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(v12, "safeValueForKeyPath:", CFSTR("textLabel.attributedText"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__0;
    v30 = __Block_byref_object_dispose__0;
    v31 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__0;
    v24 = __Block_byref_object_dispose__0;
    v25 = 0;
    AXPerformSafeBlock();
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v14, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ %@"), v16, v27[5]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setAccessibilityLabel:", v17);
    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v21[5], v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessibilityUserInputLabels:", v18);

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);

  }
  return v12;
}

void __90__MTATimerIntervalPickerViewAccessibility_pickerView_viewForRow_forComponent_reusingView___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_secondsStringForSeconds:", *(_QWORD *)(a1 + 64));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v6 = CFSTR("timer.seconds");
  }
  else if (v2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_minutesStringForMinutes:", *(_QWORD *)(a1 + 64));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v6 = CFSTR("timer.minutes");
  }
  else
  {
    if (v2)
      return;
    objc_msgSend(*(id *)(a1 + 32), "_hoursStringForHour:", *(_QWORD *)(a1 + 64));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = CFSTR("timer.hours");
  }
  accessibilityLocalizedString(v6);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

@end
