@implementation ETCanvasViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ETCanvasView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("ETCanvasView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ETCanvasView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETCanvasView"), CFSTR("isComposing"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ETCanvasView"), CFSTR("_currentSketchView"), "ETGLSketchView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ETCanvasView"), CFSTR("_lastActivityTimestamp"), "d");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETCanvasView"), CFSTR("_sketchInProgress"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETCanvasView"), CFSTR("sendCurrentMessage"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETCanvasView"), CFSTR("_setIsComposingMessageOfType:"), "v", "S", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETCanvasView"), CFSTR("_endMessage: withSend:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MediaInstructionView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MediaInstructionView"), CFSTR("_textLabel"), "UILabel");

}

- (BOOL)_accessibilityIsDirectTouching
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_accessibilitySetIsDirectTouching:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (id)_accessibilityDisableDirectTouchTimer
{
  JUMPOUT(0x23490D4ACLL);
}

- (void)_accessibilitySetDisableDirectTouchTimer:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (ETCanvasViewAccessibility)initWithFrame:(CGRect)a3
{
  ETCanvasViewAccessibility *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ETCanvasViewAccessibility;
  v3 = -[ETCanvasViewAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__accessibilityFocusChanged_, *MEMORY[0x24BDF7238], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[ETCanvasViewAccessibility _accessibilityInvalidateDirectTouchTimerAndReschedule:](self, "_accessibilityInvalidateDirectTouchTimerAndReschedule:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7238], 0);

  v4.receiver = self;
  v4.super_class = (Class)ETCanvasViewAccessibility;
  -[ETCanvasViewAccessibility dealloc](&v4, sel_dealloc);
}

- (BOOL)accessibilityActivate
{
  void *v3;

  -[ETCanvasViewAccessibility _accessibilitySetIsDirectTouching:](self, "_accessibilitySetIsDirectTouching:", 1);
  accessibilityLocalizedString(CFSTR("people.drawing.canvas.start.drawing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

  -[ETCanvasViewAccessibility _accessibilityInvalidateDirectTouchTimerAndReschedule:](self, "_accessibilityInvalidateDirectTouchTimerAndReschedule:", 1);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  return 1;
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  char v4;

  -[ETCanvasViewAccessibility storedIsAccessibilityElement](self, "storedIsAccessibilityElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (BOOL)accessibilityElementsHidden
{
  return !-[ETCanvasViewAccessibility isAccessibilityElement](self, "isAccessibilityElement");
}

- (BOOL)_accessibilityServesAsFirstElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)ETCanvasViewAccessibility;
  -[ETCanvasViewAccessibility accessibilityFrame](&v6, sel_accessibilityFrame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)accessibilityTraits
{
  _BOOL4 v2;
  unint64_t *v3;

  v2 = -[ETCanvasViewAccessibility _accessibilityIsDirectTouching](self, "_accessibilityIsDirectTouching");
  v3 = (unint64_t *)MEMORY[0x24BDF73A8];
  if (!v2)
    v3 = (unint64_t *)MEMORY[0x24BDF7408];
  return *v3;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v5;

  if (-[ETCanvasViewAccessibility _accessibilityIsDirectTouching](self, "_accessibilityIsDirectTouching"))
  {
    v2 = 0;
  }
  else
  {
    accessibilityLocalizedString(CFSTR("people.drawing.canvas"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("people.drawing.canvas.hint"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18 = 0;
  objc_opt_class();
  -[ETCanvasViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        MEMORY[0x23490D410](CFSTR("MediaInstructionView"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "safeValueForKey:", CFSTR("_textLabel"), (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "accessibilityLabel");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)_setIsComposingMessageOfType:(unsigned __int16)a3
{
  uint64_t v3;
  char v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  v5 = -[ETCanvasViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isComposing"));
  v11.receiver = self;
  v11.super_class = (Class)ETCanvasViewAccessibility;
  -[ETCanvasViewAccessibility _setIsComposingMessageOfType:](&v11, sel__setIsComposingMessageOfType_, v3);
  if ((v5 & 1) == 0
    && -[ETCanvasViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isComposing")))
  {
    switch((int)v3)
    {
      case 0:
        v6 = CFSTR("tap.announcement");
        goto LABEL_10;
      case 1:
        v6 = CFSTR("doodle.announcement");
        goto LABEL_10;
      case 2:
        v6 = CFSTR("heartbeat.announcement");
        goto LABEL_10;
      case 9:
        v6 = CFSTR("kiss.announcement");
        goto LABEL_10;
      case 10:
        v6 = CFSTR("anger.announcement");
LABEL_10:
        accessibilityLocalizedString(v6);
        v7 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        objc_msgSend(MEMORY[0x24BDD17C8], "string");
        v7 = objc_claimAutoreleasedReturnValue();
        break;
    }
    v8 = (void *)v7;
    UIAccessibilitySpeakAndDoNotBeInterrupted();
    -[ETCanvasViewAccessibility _accessibilityDisableDirectTouchTimer](self, "_accessibilityDisableDirectTouchTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "invalidate");

  }
}

- (void)_endMessage:(id)a3 withSend:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    accessibilityLocalizedString(CFSTR("sent.announcement"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakAndDoNotBeInterrupted();

  }
  _axSetIsWaitingOnETMessageStart(1);
  -[ETCanvasViewAccessibility _accessibilitySetIsDirectTouching:](self, "_accessibilitySetIsDirectTouching:", 0);
  -[ETCanvasViewAccessibility _accessibilityInvalidateDirectTouchTimerAndReschedule:](self, "_accessibilityInvalidateDirectTouchTimerAndReschedule:", 0);
  v8.receiver = self;
  v8.super_class = (Class)ETCanvasViewAccessibility;
  -[ETCanvasViewAccessibility _endMessage:withSend:](&v8, sel__endMessage_withSend_, v6, v4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  _axSetIsWaitingOnETMessageStart(0);
  v8.receiver = self;
  v8.super_class = (Class)ETCanvasViewAccessibility;
  -[ETCanvasViewAccessibility touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_, v7, v6);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ETCanvasViewAccessibility;
  -[ETCanvasViewAccessibility touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[ETCanvasViewAccessibility _accessibilityInvalidateDirectTouchTimerAndReschedule:](self, "_accessibilityInvalidateDirectTouchTimerAndReschedule:", 1);
}

- (void)_checkForIdle
{
  objc_super v3;

  if (!UIAccessibilityIsVoiceOverRunning() || (_axIsWaitingOnETMessageStart() & 1) == 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)ETCanvasViewAccessibility;
    -[ETCanvasViewAccessibility _checkForIdle](&v3, sel__checkForIdle);
  }
}

- (void)_accessibilityInvalidateDirectTouchTimerAndReschedule:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a3;
  -[ETCanvasViewAccessibility _accessibilityDisableDirectTouchTimer](self, "_accessibilityDisableDirectTouchTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  if (v3)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __83__ETCanvasViewAccessibility__accessibilityInvalidateDirectTouchTimerAndReschedule___block_invoke;
    v7[3] = &unk_2501F5EB0;
    v7[4] = self;
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, 3.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[ETCanvasViewAccessibility _accessibilitySetDisableDirectTouchTimer:](self, "_accessibilitySetDisableDirectTouchTimer:", v6);

}

void __83__ETCanvasViewAccessibility__accessibilityInvalidateDirectTouchTimerAndReschedule___block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilitySetIsDirectTouching:", 0);
  accessibilityLocalizedString(CFSTR("people.drawing.canvas.stopped.drawing"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_accessibilityFocusChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char isKindOfClass;
  uint64_t v16;
  uint64_t i;
  void *v18;
  char v19;
  void *v20;
  int v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDF7248]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDF7438]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x23490D410](CFSTR("ETPaletteCircleView"));
  v10 = MEMORY[0x23490D410](CFSTR("ETCanvasView"));
  v11 = MEMORY[0x23490D410](CFSTR("ETTranscriptColorWheelAccessibility"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 4, v9, v10, v11, MEMORY[0x23490D410](CFSTR("GestureInstructionButton")), 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    isKindOfClass = 0;
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v12);
        if ((isKindOfClass & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
          isKindOfClass = 1;
        else
          isKindOfClass = objc_opt_isKindOfClass();
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }
  else
  {
    isKindOfClass = 0;
  }

  objc_msgSend(v6, "accessibilityIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("digital.touch.picker.circle.identifier"));

  objc_msgSend(v8, "accessibilityIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("digital.touch.picker.circle.identifier"));

  if ((isKindOfClass & 1) != 0 || (v19 & 1) != 0 || v21)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ETCanvasViewAccessibility setValue:forKey:](self, "setValue:forKey:", v22, CFSTR("_lastActivityTimestamp"));

  }
}

@end
