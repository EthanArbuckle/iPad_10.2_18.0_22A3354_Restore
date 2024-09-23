@implementation PHVoicemailMessageTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHVoicemailMessageTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PHVoicemailMessageTableViewCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHVoicemailMessageTableViewCell"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHVoicemailMessageTableViewCell"), CFSTR("metadataView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("PHVoicemailMessageTableViewCell"), CFSTR("contentScrollView"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHVoicemailMessageTableViewCell"), CFSTR("loadExpandedViewsIfNecessary"), "v", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("VMMessageMetadataView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VMMessageMetadataView"), CFSTR("didTapInfo:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VMMessageMetadataView"), CFSTR("didTapAction:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHVoicemailMessageTableViewCell"), CFSTR("setExpanded:animated:"), "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PHAudioDeviceController"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("PHAudioDeviceController"), CFSTR("sharedAudioDeviceController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAudioDeviceController"), CFSTR("receiverRouteIsPicked"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAudioDeviceController"), CFSTR("speakerRouteAvailable"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAudioDeviceController"), CFSTR("pickSpeakerRoute"), "v", 0);

}

- (id)accessibilityElements
{
  int v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  v3 = -[PHVoicemailMessageTableViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded"));
  v4 = (void *)MEMORY[0x24BDBCE30];
  if (v3)
    v5 = CFSTR("contentScrollView");
  else
    v5 = CFSTR("metadataView");
  -[PHVoicemailMessageTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "axArrayByIgnoringNilElementsWithCount:", 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  char v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditing");

  return v3;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PHVoicemailMessageTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("metadataView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHVoicemailMessageTableViewCellAccessibility;
  v2 = -[PHVoicemailMessageTableViewCellAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSelected");
  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  v6 = v5 | v2;

  return v6;
}

- (double)_accessibilityAllowedGeometryOverlap
{
  return 15.0;
}

- (id)accessibilityCustomActions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("voicemail.info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:target:selector:", v5, self, sel__axInfoAction);

  objc_msgSend(v3, "addObject:", v6);
  v7 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("voicemail.share"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:target:selector:", v8, self, sel__axShareAction);

  objc_msgSend(v3, "addObject:", v9);
  return v3;
}

- (BOOL)_axInfoAction
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

void __61__PHVoicemailMessageTableViewCellAccessibility__axInfoAction__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("metadataView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didTapInfo:", 0);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (BOOL)_axShareAction
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

void __62__PHVoicemailMessageTableViewCellAccessibility__axShareAction__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("metadataView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didTapAction:", 0);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (void)loadExpandedViewsIfNecessary
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PHVoicemailMessageTableViewCellAccessibility;
  -[PHVoicemailMessageTableViewCellAccessibility loadExpandedViewsIfNecessary](&v2, sel_loadExpandedViewsIfNecessary);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;

  v4 = a4;
  v5 = a3;
  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("PHAudioDeviceController")), "safeValueForKey:", CFSTR("sharedAudioDeviceController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityIsVoiceOverRunning()
    && objc_msgSend(v7, "safeBoolForKey:", CFSTR("receiverRouteIsPicked"))
    && objc_msgSend(v7, "safeBoolForKey:", CFSTR("speakerRouteAvailable")))
  {
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __69__PHVoicemailMessageTableViewCellAccessibility_setExpanded_animated___block_invoke;
    v12 = &unk_250290778;
    v13 = v7;
    AXPerformSafeBlock();

  }
  v8.receiver = self;
  v8.super_class = (Class)PHVoicemailMessageTableViewCellAccessibility;
  -[PHVoicemailMessageTableViewCellAccessibility setExpanded:animated:](&v8, sel_setExpanded_animated_, v5, v4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

uint64_t __69__PHVoicemailMessageTableViewCellAccessibility_setExpanded_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pickSpeakerRoute");
}

@end
