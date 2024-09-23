@implementation MobileTimerUILabelAccessiblity

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UILabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  objc_super v11;
  objc_super v12;

  -[MobileTimerUILabelAccessiblity accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("timeLabel")))
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("elapsed.time.format"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12.receiver = self;
    v12.super_class = (Class)MobileTimerUILabelAccessiblity;
    -[MobileTimerUILabelAccessiblity accessibilityLabel](&v12, sel_accessibilityLabel);
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("currentLapTimeLabel")))
    {
      v10.receiver = self;
      v10.super_class = (Class)MobileTimerUILabelAccessiblity;
      -[MobileTimerUILabelAccessiblity accessibilityLabel](&v10, sel_accessibilityLabel);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v4 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("lap.time.format"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11.receiver = self;
    v11.super_class = (Class)MobileTimerUILabelAccessiblity;
    -[MobileTimerUILabelAccessiblity accessibilityLabel](&v11, sel_accessibilityLabel);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AXLocalizeDurationTime();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v8;
}

@end
