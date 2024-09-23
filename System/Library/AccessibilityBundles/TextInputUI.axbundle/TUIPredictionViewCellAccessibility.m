@implementation TUIPredictionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TUIPredictionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("UITextSuggestionWithAction"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("TUIPredictionViewCell"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_childFocusViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUIPredictionViewCell"), CFSTR("currentTextSuggestion"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextSuggestionWithAction"), CFSTR("action"), ":", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIResponder"), CFSTR("_startWritingTools:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUIPredictionViewCell"), CFSTR("_isSmartReplyCandidate:"), "B", "@", 0);

}

- (unsigned)_accessibilitySlotID
{
  void *v2;
  unsigned int v3;

  -[TUIPredictionViewCellAccessibility _axCandidate](self, "_axCandidate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "slotID");

  return v3;
}

- (BOOL)_axHideCell
{
  void *v3;
  _BOOL4 v4;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[TUIPredictionViewCellAccessibility accessibilityLabel](self, "accessibilityLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length")
      || -[TUIPredictionViewCellAccessibility _accessibilitySlotID](self, "_accessibilitySlotID"))
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      v4 = !-[TUIPredictionViewCellAccessibility _axIsTextEffectButton](self, "_axIsTextEffectButton");
    }

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isAccessibilityElement
{
  return !-[TUIPredictionViewCellAccessibility _axHideCell](self, "_axHideCell");
}

- (id)accessibilityLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  if (-[TUIPredictionViewCellAccessibility _accessibilitySlotID](self, "_accessibilitySlotID"))
  {
    v3 = objc_alloc(MEMORY[0x24BDFEA60]);
    accessibilityLocalizedString(CFSTR("proactive.suggestion"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[TUIPredictionViewCellAccessibility _accessibilitySlotID](self, "_accessibilitySlotID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttribute:forKey:", v6, *MEMORY[0x24BDFEC20]);
  }
  else
  {
    if (-[TUIPredictionViewCellAccessibility _axIsTextEffectButton](self, "_axIsTextEffectButton"))
    {
      accessibilityLocalizedString(CFSTR("open.text.effects"));
      return (id)objc_claimAutoreleasedReturnValue();
    }
    -[TUIPredictionViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("normalLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("morphingLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("text"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((!objc_msgSend(v9, "length") || (objc_msgSend(v6, "_accessibilityViewIsVisible") & 1) == 0)
      && objc_msgSend(v8, "_accessibilityViewIsVisible"))
    {
      objc_msgSend(v8, "safeStringForKey:", CFSTR("text"));
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    if (!objc_msgSend(v9, "length") && -[TUIPredictionViewCellAccessibility _axIsAutoFillKey](self, "_axIsAutoFillKey"))
    {
      accessibilityLocalizedString(CFSTR("autofill.keyboard.button"));
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v11;
    }
    if (!objc_msgSend(v9, "length"))
    {
      -[TUIPredictionViewCellAccessibility _axTextSuggestionWithAction](self, "_axTextSuggestionWithAction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      v21 = &v20;
      v22 = 0x3032000000;
      v23 = __Block_byref_object_copy__0;
      v24 = __Block_byref_object_dispose__0;
      v25 = 0;
      v15 = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __56__TUIPredictionViewCellAccessibility_accessibilityLabel__block_invoke;
      v18 = &unk_2503B4D30;
      v19 = v12;
      AXPerformSafeBlock();
      v13 = (id)v21[5];

      _Block_object_dispose(&v20, 8);
      v9 = v13;
    }
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet", v15, v16, v17, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

void __56__TUIPredictionViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  if ((char *)objc_msgSend(*(id *)(a1 + 32), "action") == sel__startWritingTools_)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("text.assistant.keyboard.button"), &stru_2503B5180, CFSTR("Accessibility-GreymatterTA"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;

  if (-[TUIPredictionViewCellAccessibility _axIsAutoFillKey](self, "_axIsAutoFillKey"))
    return *MEMORY[0x24BDF73B0];
  -[TUIPredictionViewCellAccessibility _axTextSuggestionWithAction](self, "_axTextSuggestionWithAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

    return *MEMORY[0x24BDF73B0];
  }
  if (-[TUIPredictionViewCellAccessibility _axIsTextEffectButton](self, "_axIsTextEffectButton"))
    return *MEMORY[0x24BDF73B0];
  v5 = *MEMORY[0x24BEBAEA8];
  v6 = -[TUIPredictionViewCellAccessibility _axIsAutocorrection](self, "_axIsAutocorrection");
  v7 = *MEMORY[0x24BDF7400];
  if (!v6)
    v7 = 0;
  return v7 | v5;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (BOOL)_accessibilityIncludeRoleDescription
{
  return 1;
}

- (id)_accessibilityRoleDescription
{
  void *v2;

  if (-[TUIPredictionViewCellAccessibility _axIsSmartReply](self, "_axIsSmartReply"))
  {
    accessibilityLocalizedString(CFSTR("smart.reply"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)_axIsTextEffectButton
{
  void *v2;
  BOOL v3;

  -[TUIPredictionViewCellAccessibility _axCandidate](self, "_axCandidate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "customInfoType") == 0x8000;

  return v3;
}

- (BOOL)_axIsAutoFillKey
{
  void *v2;
  BOOL v3;

  -[TUIPredictionViewCellAccessibility _axCandidate](self, "_axCandidate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "customInfoType") == 32;

  return v3;
}

- (BOOL)_axIsSmartReply
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  AXPerformSafeBlock();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __53__TUIPredictionViewCellAccessibility__axIsSmartReply__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_axCandidate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "_isSmartReplyCandidate:", v3);

}

- (id)_axTextSuggestionWithAction
{
  void *v2;
  id v3;

  -[TUIPredictionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("currentTextSuggestion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349226DC](CFSTR("UITextSuggestionWithAction"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)_axActivateSpeaking:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentInputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v8 = (void *)getSpeakTypingServicesClass_softClass;
  v16 = getSpeakTypingServicesClass_softClass;
  if (!getSpeakTypingServicesClass_softClass)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __getSpeakTypingServicesClass_block_invoke;
    v12[3] = &unk_2503B4D80;
    v12[4] = &v13;
    __getSpeakTypingServicesClass_block_invoke((uint64_t)v12);
    v8 = (void *)v14[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v13, 8);
  objc_msgSend(v9, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIPredictionViewCellAccessibility accessibilityLabel](self, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notifySpeakServicesToFeedbackQuickTypePrediction:forCurrentInputMode:", v11, v7);

}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (_AXSQuickTypePredictionFeedbackEnabled() && UIAccessibilityIsSwitchControlRunning())
  {
    v3 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("speak.prediction"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithName:target:selector:", v4, self, sel__axActivateSpeaking_);

    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TUIPredictionViewCellAccessibility;
    -[TUIPredictionViewCellAccessibility accessibilityCustomActions](&v8, sel_accessibilityCustomActions);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_childFocusViews
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUIPredictionViewCellAccessibility;
  -[TUIPredictionViewCellAccessibility _childFocusViews](&v7, sel__childFocusViews);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if ((-[TUIPredictionViewCellAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)v5 = (id)MEMORY[0x24BDBD1A8];
  else
    v5 = v4;

  return v5;
}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  return 1;
}

@end
