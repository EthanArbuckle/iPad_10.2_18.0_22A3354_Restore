@implementation PHHandsetDialerDeleteButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHHandsetDialerDeleteButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axDeleteButtonWasHidden
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetDeleteButtonWasHidden:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("delete.title"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHHandsetDialerDeleteButtonAccessibility;
  return *MEMORY[0x24BEBB108] | -[PHHandsetDialerDeleteButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF73D0];
}

- (void)setAlpha:(double)a3
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHHandsetDialerDeleteButtonAccessibility;
  -[PHHandsetDialerDeleteButtonAccessibility setAlpha:](&v9, sel_setAlpha_);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PHHandsetDialerDeleteButtonAccessibility _axDeleteButtonWasHidden](self, "_axDeleteButtonWasHidden"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v6 != (_DWORD)v8)
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    -[PHHandsetDialerDeleteButtonAccessibility _axSetDeleteButtonWasHidden:](self, "_axSetDeleteButtonWasHidden:", v8);
  }
}

@end
