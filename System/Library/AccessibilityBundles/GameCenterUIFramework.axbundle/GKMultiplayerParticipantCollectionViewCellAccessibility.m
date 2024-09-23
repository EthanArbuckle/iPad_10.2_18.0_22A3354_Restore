@implementation GKMultiplayerParticipantCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GameCenterUI.GKMultiplayerParticipantCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.GKMultiplayerParticipantCollectionViewCell"), CFSTR("accessibilityNameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.GKMultiplayerParticipantCollectionViewCell"), CFSTR("accessibilitySubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.GKMultiplayerParticipantCollectionViewCell"), CFSTR("accessibilityStatusAccessoryView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("GameCenterUI.DynamicTypeButton"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[GKMultiplayerParticipantCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityNameLabel, accessibilitySubtitleLabel, accessibilityStatusAccessoryView"));
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  char v16;
  objc_super v17;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)GKMultiplayerParticipantCollectionViewCellAccessibility;
  -[GKMultiplayerParticipantCollectionViewCellAccessibility accessibilityCustomActions](&v17, sel_accessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  v16 = 0;
  objc_opt_class();
  -[GKMultiplayerParticipantCollectionViewCellAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", MEMORY[0x23490F8D4](CFSTR("GameCenterUI.DynamicTypeButton")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BDF6788]);
    AXGameCenterUIFrameworkLocString(CFSTR("REMOVE_PLAYERS"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __85__GKMultiplayerParticipantCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke;
    v14 = &unk_250216588;
    v15 = v6;
    v9 = (void *)objc_msgSend(v7, "initWithName:actionHandler:", v8, &v11);

    objc_msgSend(v3, "axSafelyAddObject:", v9, v11, v12, v13, v14);
  }

  return v3;
}

uint64_t __85__GKMultiplayerParticipantCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 64);
  return 1;
}

@end
