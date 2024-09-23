@implementation SleepScheduleClockHandAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SleepHealthUI.SleepScheduleClockHand");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axLastSpokenMessage
{
  JUMPOUT(0x23491E7E0);
}

- (void)_axSetLastSpokenMessage:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleClockHand"), CFSTR("accessibilityHandIsBedtime"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.ScheduleOccurrenceComponentsEditTableViewCell"), CFSTR("accessibilityComponentsEditView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleComponentsEditView"), CFSTR("accessibilityComponentsHeader"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleComponentsHeader"), CFSTR("accessibilityBedtimeTimeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleComponentsHeader"), CFSTR("accessibilityWakeUpTimeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleComponentsEditView"), CFSTR("accessibilityClock"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleClock"), CFSTR("accessibilityRoundedBedtimeComponents"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleClock"), CFSTR("accessibilityRoundedWakeUpComponents"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleClock"), CFSTR("accessibilitySetModel:wakeUpComponents:timeInBedGoal:alarmEnabled:isForSingleDayOverride:"), "v", "@", "@", "d", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleClock"), CFSTR("accessibilityAlarmEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleComponentsEditView"), CFSTR("clockDidChange:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleComponentsEditView"), CFSTR("accessibilityClockCaption"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleClockCaption"), CFSTR("accessibilityClockCaptionMessage"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleClock"), CFSTR("accessibilityTimeInBed"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SleepHealthUI.SleepScheduleClock"), CFSTR("accessibilityTimeInBedGoal"), "d", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("UITableViewCellAccessibilityElement"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCellAccessibilityElement"), CFSTR("realTableViewCell"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0];
}

- (id)accessibilityLabel
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  __CFString *v8;

  v3 = -[SleepScheduleClockHandAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityHandIsBedtime"));
  -[SleepScheduleClockHandAccessibility _axEditCell](self, "_axEditCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("accessibilityComponentsEditView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("accessibilityClock"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "safeBoolForKey:", CFSTR("accessibilityAlarmEnabled"));

  v8 = CFSTR("wakeup.alarm.off");
  if (v7)
    v8 = CFSTR("wakeup.alarm.on");
  if (v3)
    return accessibilityLocalizedString(CFSTR("bedtime"));
  else
    return accessibilityLocalizedString(v8);
}

- (id)accessibilityValue
{
  SleepScheduleClockHandAccessibility *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = self;
  -[SleepScheduleClockHandAccessibility _axEditCell](self, "_axEditCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("accessibilityComponentsEditView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("accessibilityComponentsHeader"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = -[SleepScheduleClockHandAccessibility safeBoolForKey:](v2, "safeBoolForKey:", CFSTR("accessibilityHandIsBedtime"));
  objc_opt_class();
  if ((_DWORD)v2)
    v6 = CFSTR("accessibilityBedtimeTimeLabel");
  else
    v6 = CFSTR("accessibilityWakeUpTimeLabel");
  objc_msgSend(v5, "safeValueForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)accessibilityIncrement
{
  -[SleepScheduleClockHandAccessibility adjustClockHandIncrement:](self, "adjustClockHandIncrement:", 1);
}

- (void)accessibilityDecrement
{
  -[SleepScheduleClockHandAccessibility adjustClockHandIncrement:](self, "adjustClockHandIncrement:", 0);
}

- (void)adjustClockHandIncrement:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v3 = a3;
  -[SleepScheduleClockHandAccessibility _axEditCell](self, "_axEditCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("accessibilityComponentsEditView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("accessibilityClock"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SleepScheduleClockHandAccessibility _axIsValidSleepDurationIncrement:clock:isAdjustingBedtime:](self, "_axIsValidSleepDurationIncrement:clock:isAdjustingBedtime:", v3, v7, -[SleepScheduleClockHandAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityHandIsBedtime"))))
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy_;
    v26 = __Block_byref_object_dispose_;
    v27 = 0;
    LOBYTE(v16) = 0;
    objc_opt_class();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("accessibilityRoundedBedtimeComponents"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v23[5];
    v23[5] = v9;

    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy_;
    v20 = __Block_byref_object_dispose_;
    v21 = 0;
    objc_opt_class();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("accessibilityRoundedWakeUpComponents"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v17[5];
    v17[5] = v12;

    v14 = MEMORY[0x24BDAC760];
    v15 = v7;
    AXPerformSafeBlock();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    -[SleepScheduleClockHandAccessibility _axSpeakClockAlertIfNeeded](self, "_axSpeakClockAlertIfNeeded", v14, 3221225472, __64__SleepScheduleClockHandAccessibility_adjustClockHandIncrement___block_invoke, &unk_25035E968, self);

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);

  }
}

void __64__SleepScheduleClockHandAccessibility_adjustClockHandIncrement___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  void *v16;
  id v17;

  v2 = *(unsigned __int8 *)(a1 + 64);
  v3 = *(unsigned __int8 *)(a1 + 65);
  v4 = *(void **)(a1 + 32);
  if (v2)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v3)
      objc_msgSend(v4, "incrementComponents:", v5);
    else
      objc_msgSend(v4, "decrementComponents:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
  }
  else
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v3)
      objc_msgSend(v4, "incrementComponents:", v7);
    else
      objc_msgSend(v4, "decrementComponents:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 56);
  }
  v9 = *(_QWORD *)(v8 + 8);
  v10 = v6;
  v11 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v10;

  v12 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(v12, "safeDoubleForKey:", CFSTR("accessibilityTimeInBedGoal"));
  objc_msgSend(v12, "accessibilitySetModel:wakeUpComponents:timeInBedGoal:alarmEnabled:isForSingleDayOverride:", v13, v14, objc_msgSend(*(id *)(a1 + 40), "safeBoolForKey:", CFSTR("accessibilityAlarmEnabled")), 0, v15);
  objc_msgSend(*(id *)(a1 + 32), "_axEditCell");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "safeValueForKey:", CFSTR("accessibilityComponentsEditView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "clockDidChange:", *(_QWORD *)(a1 + 40));

}

- (BOOL)_axIsValidSleepDurationIncrement:(BOOL)a3 clock:(id)a4 isAdjustingBedtime:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  double v9;
  BOOL v10;

  v5 = a5;
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v5 || v6)
  {
    objc_msgSend(v7, "safeDoubleForKey:", CFSTR("accessibilityTimeInBed"));
    if (v5 || !v6)
    {
      if (v9 > 3600.0)
        goto LABEL_6;
LABEL_8:
      v10 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    objc_msgSend(v7, "safeDoubleForKey:", CFSTR("accessibilityTimeInBed"));
  }
  if (v9 >= 72000.0)
    goto LABEL_8;
LABEL_6:
  v10 = 1;
LABEL_9:

  return v10;
}

- (id)incrementComponents:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "minute");
  v5 = objc_msgSend(v3, "hour");
  if (v4 < 55)
  {
    objc_msgSend(v3, "setMinute:", v4 + 5);
  }
  else
  {
    v6 = v5;
    objc_msgSend(v3, "setMinute:", 0);
    if (v6 < 23)
    {
      v8 = v6 + 1;
      v7 = v3;
    }
    else
    {
      v7 = v3;
      v8 = 0;
    }
    objc_msgSend(v7, "setHour:", v8);
  }
  return v3;
}

- (id)decrementComponents:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "minute");
  v5 = objc_msgSend(v3, "hour");
  if (v4 <= 0)
  {
    v6 = v5;
    objc_msgSend(v3, "setMinute:", 55);
    if (v6 <= 0)
    {
      v8 = v3;
      v7 = 23;
    }
    else
    {
      v7 = v6 - 1;
      v8 = v3;
    }
    objc_msgSend(v8, "setHour:", v7);
  }
  else
  {
    objc_msgSend(v3, "setMinute:", v4 - 5);
  }
  return v3;
}

- (void)_axSpeakClockAlertIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[SleepScheduleClockHandAccessibility _axEditCell](self, "_axEditCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("accessibilityComponentsEditView"));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "safeValueForKey:", CFSTR("accessibilityClockCaption"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", CFSTR("accessibilityClockCaptionMessage"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SleepScheduleClockHandAccessibility _axLastSpokenMessage](self, "_axLastSpokenMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "isEqualToString:", v6);

  if ((v4 & 1) == 0)
  {
    UIAccessibilitySpeakOrQueueIfNeeded();
    -[SleepScheduleClockHandAccessibility _axSetLastSpokenMessage:](self, "_axSetLastSpokenMessage:", v7);
  }

}

- (id)_axEditCell
{
  void *v2;
  id v3;
  void *v4;

  -[SleepScheduleClockHandAccessibility accessibilityContainer](self, "accessibilityContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23491E768](CFSTR("SleepHealthUI.ScheduleOccurrenceComponentsEditTableViewCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    MEMORY[0x23491E768](CFSTR("UITableViewCellAccessibilityElement"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v2, "safeValueForKey:", CFSTR("realTableViewCell"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
LABEL_7:

  return v4;
}

@end
