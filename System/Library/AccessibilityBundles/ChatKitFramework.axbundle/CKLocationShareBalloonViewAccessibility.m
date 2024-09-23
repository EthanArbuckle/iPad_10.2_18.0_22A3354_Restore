@implementation CKLocationShareBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKLocationShareBalloonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKLocationShareBalloonView"), CFSTR("titleString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKLocationShareBalloonView"), CFSTR("locationString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKLocationShareBalloonView"), CFSTR("startSharingButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKLocationShareBalloonView"), CFSTR("ignoreButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKLocationShareBalloonView"), CFSTR("offerState"), "q", 0);

}

- (id)accessibilityLabel
{
  return (id)-[CKLocationShareBalloonViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("titleString, locationString"));
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CKLocationShareBalloonViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("offerState")))
  {
    accessibilityLocalizedString(CFSTR("start.sharing.button"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKLocationShareBalloonViewAccessibility _axActionForButton:withLabel:](self, "_axActionForButton:withLabel:", CFSTR("startSharingButton"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "axSafelyAddObject:", v5);

    accessibilityLocalizedString(CFSTR("ignore.sharing.button"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKLocationShareBalloonViewAccessibility _axActionForButton:withLabel:](self, "_axActionForButton:withLabel:", CFSTR("ignoreButton"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "axSafelyAddObject:", v7);

  }
  return v3;
}

- (id)_axActionForButton:(id)a3 withLabel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  char v15;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  -[CKLocationShareBalloonViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x24BDF6788]);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __72__CKLocationShareBalloonViewAccessibility__axActionForButton_withLabel___block_invoke;
    v13[3] = &unk_2501B1BC0;
    v14 = v9;
    v11 = (void *)objc_msgSend(v10, "initWithName:actionHandler:", v7, v13);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __72__CKLocationShareBalloonViewAccessibility__axActionForButton_withLabel___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 64);
  return 1;
}

@end
