@implementation MobileTimerUIButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[MobileTimerUIButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("WeatherButton")))
  {
    v4 = CFSTR("weather.button");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("YahooButton")))
    {
      v8.receiver = self;
      v8.super_class = (Class)MobileTimerUIButtonAccessibility;
      -[MobileTimerUIButtonAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v4 = CFSTR("yahoo.button");
  }
  accessibilityNonLocalizedString(v4);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v6 = (void *)v5;

  return v6;
}

- (id)accessibilityLanguage
{
  void *v3;
  __CFString *v4;
  objc_super v6;

  -[MobileTimerUIButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WeatherButton")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("YahooButton")) & 1) != 0)
  {
    v4 = CFSTR("en-US");
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MobileTimerUIButtonAccessibility;
    -[MobileTimerUIButtonAccessibility accessibilityLanguage](&v6, sel_accessibilityLanguage);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  id v4;
  objc_super v6;

  -[MobileTimerUIButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WeatherButton")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("YahooButton")))
  {
    v4 = (id)*MEMORY[0x24BDF73D8];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MobileTimerUIButtonAccessibility;
    v4 = -[MobileTimerUIButtonAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  }

  return (unint64_t)v4;
}

- (BOOL)isAccessibilityElement
{
  objc_super v4;

  if (-[MobileTimerUIButtonAccessibility _isAlarmTableViewCellDescendantDisclosureButton](self, "_isAlarmTableViewCellDescendantDisclosureButton"))
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MobileTimerUIButtonAccessibility;
  return -[MobileTimerUIButtonAccessibility isAccessibilityElement](&v4, sel_isAccessibilityElement);
}

- (BOOL)_isAlarmTableViewCellDescendantDisclosureButton
{
  void *v3;
  void *v4;
  char v5;

  if (_isAlarmTableViewCellDescendantDisclosureButton__AlarmTableViewCellClassOnceToken != -1)
    dispatch_once(&_isAlarmTableViewCellDescendantDisclosureButton__AlarmTableViewCellClassOnceToken, &__block_literal_global_1);
  -[MobileTimerUIButtonAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", _isAlarmTableViewCellDescendantDisclosureButton__AlarmTableViewCellClass);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[MobileTimerUIButtonAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("UITableCellViewDisclosure"));

  if (v3)
    return v5;
  else
    return 0;
}

uint64_t __83__MobileTimerUIButtonAccessibility__isAlarmTableViewCellDescendantDisclosureButton__block_invoke()
{
  uint64_t result;

  result = MEMORY[0x234916758](CFSTR("MTAAlarmTableViewCell"));
  _isAlarmTableViewCellDescendantDisclosureButton__AlarmTableViewCellClass = result;
  return result;
}

@end
