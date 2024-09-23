@implementation EKEventGestureControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKEventGestureController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventGestureController"), CFSTR("_createTemporaryView:animated:"), "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventGestureController"), CFSTR("_isNewEvent"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventGestureController"), CFSTR("_delegate"), "<EKEventGestureControllerDelegate>");
  objc_opt_class();
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventGestureController"), CFSTR("_latestTouchPoint"), __ax_verbose_encode_with_type_encoding_group_class());
  objc_opt_class();
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventGestureController"), CFSTR("_touchOffset"), __ax_verbose_encode_with_type_encoding_group_class());
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventGestureController"), CFSTR("_currentDragType"), "i");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventGestureController"), CFSTR("_draggingView"), "EKDayOccurrenceView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventGestureController"), CFSTR("_longPress:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventGestureController"), CFSTR("_update"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventGestureController"), CFSTR("_commit"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayOccurrenceView"), CFSTR("occurrence"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("EKEventGestureControllerDelegate"), CFSTR("eventGestureController:dateAtPoint:"));

}

- (void)_longPress:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned int v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EKEventGestureControllerAccessibility;
  v4 = a3;
  -[EKEventGestureControllerAccessibility _longPress:](&v8, sel__longPress_, v4);
  v5 = objc_msgSend(v4, "state", v8.receiver, v8.super_class);

  if (v5 == 1)
  {
    v6 = -[EKEventGestureControllerAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("_currentDragType"));
    if (v6 > 2)
    {
      v7 = 0;
    }
    else
    {
      accessibilityLocalizedString(*(&off_2501FCF40 + (int)v6));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    UIAccessibilitySpeak();

  }
}

- (void)_update
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  uint64_t v37;
  double *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double (*v43)(uint64_t);
  void *v44;
  id v45;
  EKEventGestureControllerAccessibility *v46;
  _QWORD *v47;
  uint64_t v48;
  _QWORD v49[6];
  objc_super v50;

  v50.receiver = self;
  v50.super_class = (Class)EKEventGestureControllerAccessibility;
  -[EKEventGestureControllerAccessibility _update](&v50, sel__update);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[EKEventGestureControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_delegate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
LABEL_12:

      return;
    }
    v4 = -[EKEventGestureControllerAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("_currentDragType"));
    -[EKEventGestureControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_latestTouchPoint"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pointValue");
    v7 = v6;
    v9 = v8;

    -[EKEventGestureControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_touchOffset"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pointValue");
    v12 = v11;
    v14 = v13;

    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x3010000000;
    v49[3] = "";
    *(double *)&v49[4] = v7 - v12;
    *(double *)&v49[5] = v9 - v14;
    objc_opt_class();
    -[EKEventGestureControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_draggingView.occurrence"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = MEMORY[0x24BDAC760];
    if (v4 == 2)
    {
      objc_msgSend(v16, "duration");
      v19 = v18;
      v41 = v17;
      v42 = 3221225472;
      v43 = __48__EKEventGestureControllerAccessibility__update__block_invoke;
      v44 = &unk_2501FCEF8;
      v47 = v49;
      v45 = v3;
      v46 = self;
      v48 = v19;
      AXPerformSafeBlock();

    }
    v20 = (void *)MEMORY[0x24BDBCE60];
    v37 = 0;
    v38 = (double *)&v37;
    v39 = 0x2020000000;
    v40 = 0;
    v36 = v3;
    AXPerformSafeBlock();
    v21 = v38[3];

    _Block_object_dispose(&v37, 8);
    objc_msgSend(v20, "dateWithTimeIntervalSinceReferenceDate:", v21, v17, 3221225472, __48__EKEventGestureControllerAccessibility__update__block_invoke_2, &unk_2501FCF20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "components:fromDate:", 254, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setMinute:", (int)(floor(((double)objc_msgSend(v24, "minute") + 7.5) / 15.0) * 15.0));
    objc_msgSend(v23, "dateFromComponents:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v4 == 2)
    {
      objc_msgSend(v16, "startDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "timeIntervalSince1970");
      v28 = v33;

      objc_msgSend(v26, "timeIntervalSince1970");
      v31 = v34;
    }
    else
    {
      if (v4)
        goto LABEL_10;
      objc_msgSend(v25, "timeIntervalSince1970");
      v28 = v27;
      objc_msgSend(v16, "endDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "timeIntervalSince1970");
      v31 = v30;

    }
    if (v31 - v28 < 1800.0)
    {
LABEL_11:

      _Block_object_dispose(v49, 8);
      goto LABEL_12;
    }
LABEL_10:
    objc_msgSend(v26, "_accessibilityTimeString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventGestureControllerAccessibility _speakNotificationIfNecessary:shouldSpeakWithoutInterruption:shouldSpeakOnlyIfNotSpeaking:](self, "_speakNotificationIfNecessary:shouldSpeakWithoutInterruption:shouldSpeakOnlyIfNotSpeaking:", v35, 0, 1);

    goto LABEL_11;
  }
}

double __48__EKEventGestureControllerAccessibility__update__block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  double result;

  objc_msgSend(*(id *)(a1 + 32), "eventGestureController:heightForOccurrenceViewOfDuration:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  result = round(v2) + *(double *)(v3 + 40);
  *(double *)(v3 + 40) = result;
  return result;
}

uint64_t __48__EKEventGestureControllerAccessibility__update__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "eventGestureController:dateAtPoint:", *(_QWORD *)(a1 + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

- (void)_commit
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v3 = -[EKEventGestureControllerAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("_currentDragType"));
  v12.receiver = self;
  v12.super_class = (Class)EKEventGestureControllerAccessibility;
  -[EKEventGestureControllerAccessibility _commit](&v12, sel__commit);
  objc_opt_class();
  -[EKEventGestureControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_draggingView.occurrence"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == 2)
  {
    objc_msgSend(v5, "endDate");
    v7 = objc_claimAutoreleasedReturnValue();

    AXDateStringForFormat();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("ended.end.time.adjust");
    v6 = (void *)v7;
  }
  else
  {
    AXDateStringForFormat();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 == 1)
    {
      v9 = CFSTR("ended.time.adjust");
    }
    else
    {
      if (v3)
      {
        v10 = 0;
        goto LABEL_8;
      }
      v9 = CFSTR("ended.start.time.adjust");
    }
  }
  accessibilityLocalizedString(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventGestureControllerAccessibility _speakNotificationIfNecessary:shouldSpeakWithoutInterruption:shouldSpeakOnlyIfNotSpeaking:](self, "_speakNotificationIfNecessary:shouldSpeakWithoutInterruption:shouldSpeakOnlyIfNotSpeaking:", v11, 1, 0);

}

- (void)_speakNotificationIfNecessary:(id)a3 shouldSpeakWithoutInterruption:(BOOL)a4 shouldSpeakOnlyIfNotSpeaking:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  id v9;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  -[EKEventGestureControllerAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("lastNotificationString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", v8) & 1) == 0)
  {
    if (v6)
    {
      UIAccessibilitySpeakAndDoNotBeInterrupted();
    }
    else if (v5)
    {
      UIAccessibilitySpeakIfNotSpeaking();
    }
    else
    {
      UIAccessibilitySpeak();
    }
  }
  -[EKEventGestureControllerAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v9, CFSTR("lastNotificationString"));

}

- (id)_createTemporaryView:(id)a3 animated:(BOOL)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKEventGestureControllerAccessibility;
  -[EKEventGestureControllerAccessibility _createTemporaryView:animated:](&v6, sel__createTemporaryView_animated_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);
  return v4;
}

@end
