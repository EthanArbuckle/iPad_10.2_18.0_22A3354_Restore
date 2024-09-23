@implementation UIStatusBarIndicatorItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBarIndicatorItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v27;
  id location;
  id v29;
  id v30[3];

  v30[2] = self;
  v30[1] = (id)a2;
  v30[0] = 0;
  v29 = (id)-[UIStatusBarIndicatorItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("item"));
  location = (id)objc_msgSend(v29, "safeValueForKey:", CFSTR("indicatorName"));
  if ((objc_msgSend(location, "isEqualToString:", CFSTR("Alarm")) & 1) != 0)
  {
    v2 = accessibilityLocalizedString(CFSTR("status.alarm.clock.icon"));
    v3 = v30[0];
    v30[0] = v2;

  }
  else if ((objc_msgSend(location, "isEqualToString:", CFSTR("Plus")) & 1) != 0)
  {
    v4 = accessibilityLocalizedString(CFSTR("status.nike.plus.icon"));
    v5 = v30[0];
    v30[0] = v4;

  }
  else if ((objc_msgSend(location, "isEqualToString:", CFSTR("Play")) & 1) != 0)
  {
    v6 = accessibilityLocalizedString(CFSTR("status.play.icon"));
    v7 = v30[0];
    v30[0] = v6;

  }
  else if ((objc_msgSend(location, "isEqualToString:", CFSTR("CallForward")) & 1) != 0)
  {
    v8 = accessibilityLocalizedString(CFSTR("status.call.forward.icon"));
    v9 = v30[0];
    v30[0] = v8;

  }
  else if ((objc_msgSend(location, "isEqualToString:", CFSTR("VPN")) & 1) != 0)
  {
    v10 = accessibilityLocalizedString(CFSTR("status.vpn.icon"));
    v11 = v30[0];
    v30[0] = v10;

  }
  else if ((objc_msgSend(location, "isEqualToString:", CFSTR("TTY")) & 1) != 0)
  {
    if ((objc_msgSend(MEMORY[0x24BE7CB70], "isRTTSupported") & 1) != 0)
      v12 = accessibilityLocalizedString(CFSTR("status.rtt.tty.icon"));
    else
      v12 = accessibilityLocalizedString(CFSTR("status.tty.icon"));
    v13 = v30[0];
    v30[0] = v12;

  }
  else if ((objc_msgSend(location, "isEqualToString:", CFSTR("Location")) & 1) != 0)
  {
    v14 = accessibilityLocalizedString(CFSTR("status.location.icon"));
    v15 = v30[0];
    v30[0] = v14;

  }
  else if ((objc_msgSend(location, "isEqualToString:", CFSTR("RotationLock")) & 1) != 0)
  {
    v16 = accessibilityLocalizedString(CFSTR("status.rotationlock.icon"));
    v17 = v30[0];
    v30[0] = v16;

  }
  else if ((objc_msgSend(location, "isEqualToString:", CFSTR("AirPlay")) & 1) != 0)
  {
    v18 = accessibilityLocalizedString(CFSTR("status.airplay.icon"));
    v19 = v30[0];
    v30[0] = v18;

  }
  else if ((objc_msgSend(location, "isEqualToString:", CFSTR("BTHeadphones")) & 1) != 0)
  {
    v20 = accessibilityLocalizedString(CFSTR("status.bluetoothheadphones"));
    v21 = v30[0];
    v30[0] = v20;

  }
  else if ((objc_msgSend(location, "isEqualToString:", CFSTR("Siri")) & 1) != 0)
  {
    v22 = accessibilityLocalizedString(CFSTR("status.siri"));
    v23 = v30[0];
    v30[0] = v22;

  }
  else if ((objc_msgSend(location, "isEqualToString:", CFSTR("CarPlay")) & 1) != 0)
  {
    v24 = accessibilityLocalizedString(CFSTR("status.carplay"));
    v25 = v30[0];
    v30[0] = v24;

  }
  v27 = v30[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(v30, 0);
  return v27;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  UIStatusBarIndicatorItemViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarIndicatorItemViewAccessibility;
  return -[UIStatusBarIndicatorItemViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB180];
}

@end
