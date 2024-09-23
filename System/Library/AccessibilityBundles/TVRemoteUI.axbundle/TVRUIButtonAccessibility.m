@implementation TVRUIButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TVRUIButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[TVRUIButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  objc_super v9;
  objc_super v10;
  char v11;

  v11 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "buttonType");
  switch(v4)
  {
    case 0:
    case 17:
    case 18:
    case 20:
    case 21:
    case 22:
      v10.receiver = self;
      v10.super_class = (Class)TVRUIButtonAccessibility;
      -[TVRUIButtonAccessibility accessibilityLabel](&v10, sel_accessibilityLabel);
      goto LABEL_3;
    case 1:
      v6 = CFSTR("tv.remote.touchpad.select.button");
      goto LABEL_29;
    case 2:
      v6 = CFSTR("tv.button.menu.label");
      goto LABEL_29;
    case 3:
      v6 = CFSTR("tv.button.home.label");
      goto LABEL_29;
    case 4:
      if ((AXDeviceIsSiriAvailable() & 1) == 0)
        goto LABEL_13;
      v6 = CFSTR("tv.button.siri.label");
      goto LABEL_29;
    case 5:
      v6 = CFSTR("tv.button.play.label");
      goto LABEL_29;
    case 6:
      v6 = CFSTR("tv.button.fast.forward.label");
      goto LABEL_29;
    case 7:
      v6 = CFSTR("tv.button.rewind.label");
      goto LABEL_29;
    case 8:
      v6 = CFSTR("tv.button.skip.next.label");
      goto LABEL_29;
    case 9:
      v6 = CFSTR("tv.button.skip.previous.label");
      goto LABEL_29;
    case 10:
      v6 = CFSTR("tv.button.volume.up.label");
      goto LABEL_29;
    case 11:
      v6 = CFSTR("tv.button.volume.down.label");
      goto LABEL_29;
    case 12:
      v6 = CFSTR("tv.remote.touchpad.up.button");
      goto LABEL_29;
    case 13:
      v6 = CFSTR("tv.remote.touchpad.down.button");
      goto LABEL_29;
    case 14:
      v6 = CFSTR("tv.remote.touchpad.left.button");
      goto LABEL_29;
    case 15:
      v6 = CFSTR("tv.remote.touchpad.right.button");
      goto LABEL_29;
    case 16:
      v6 = CFSTR("tv.button.toggle.captions");
      goto LABEL_29;
    case 19:
      goto LABEL_7;
    case 23:
      v6 = CFSTR("tv.button.back.label");
      goto LABEL_29;
    case 24:
      v6 = CFSTR("tv.button.exit.label");
      goto LABEL_29;
    case 25:
      v6 = CFSTR("tv.button.info.label");
      goto LABEL_29;
    default:
      if (v4 == 9998)
      {
LABEL_13:
        v6 = CFSTR("tv.button.search.label");
        goto LABEL_29;
      }
      if (v4 == 9999)
      {
        v6 = CFSTR("tv.button.keyboard.label");
LABEL_29:
        accessibilityLocalizedString(v6);
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
LABEL_7:
      v9.receiver = self;
      v9.super_class = (Class)TVRUIButtonAccessibility;
      -[TVRUIButtonAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
LABEL_3:
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_30:
      v7 = (void *)v5;

      return v7;
  }
}

- (id)accessibilityHint
{
  void *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  char v9;

  v9 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "buttonType") == 4)
  {
    if ((AXDeviceIsSiriAvailable() & 1) != 0)
      v4 = CFSTR("tv.button.siri.hint");
    else
      v4 = CFSTR("tv.button.search.hint");
    accessibilityLocalizedString(v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TVRUIButtonAccessibility;
    -[TVRUIButtonAccessibility accessibilityHint](&v8, sel_accessibilityHint);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

@end
