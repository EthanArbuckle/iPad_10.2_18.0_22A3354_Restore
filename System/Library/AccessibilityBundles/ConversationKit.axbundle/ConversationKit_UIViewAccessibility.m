@implementation ConversationKit_UIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("ConversationKit.MultiwayViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("ConversationKit.LocalParticipantView"));
  objc_msgSend(v3, "validateClass:", CFSTR("ConversationKit.ParticipantView"));

}

- (BOOL)_accessibilityIsMultiwayContainerView
{
  void *v2;
  char isKindOfClass;

  -[ConversationKit_UIViewAccessibility _accessibilityViewController](self, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490C0EC](CFSTR("ConversationKit.MultiwayViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilityScrollStatus
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  objc_super v20;

  if (-[ConversationKit_UIViewAccessibility _accessibilityIsMultiwayContainerView](self, "_accessibilityIsMultiwayContainerView"))
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 1;
    -[ConversationKit_UIViewAccessibility _axParticipantViews](self, "_axParticipantViews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__0;
    v14 = __Block_byref_object_dispose__0;
    objc_msgSend(v3, "firstObject");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __65__ConversationKit_UIViewAccessibility__accessibilityScrollStatus__block_invoke;
    v9[3] = &unk_2501E5CC8;
    v9[4] = &v10;
    v9[5] = &v16;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
    if (*((_BYTE *)v17 + 24))
    {
      v4 = 0;
    }
    else
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("participant.focused"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v11[5], "accessibilityLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v7, v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    _Block_object_dispose(&v10, 8);

    _Block_object_dispose(&v16, 8);
    return v4;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)ConversationKit_UIViewAccessibility;
    -[ConversationKit_UIViewAccessibility _accessibilityScrollStatus](&v20, sel__accessibilityScrollStatus);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_axParticipantViews
{
  return (id)-[ConversationKit_UIViewAccessibility _accessibilityFindUnsortedDescendantsPassingTest:](self, "_accessibilityFindUnsortedDescendantsPassingTest:", &__block_literal_global_5);
}

@end
