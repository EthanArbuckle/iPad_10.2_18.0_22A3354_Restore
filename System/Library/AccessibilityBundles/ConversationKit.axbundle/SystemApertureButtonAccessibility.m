@implementation SystemApertureButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.SystemApertureButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  __CFString *v4;
  id v5;
  void *v7;
  void *v8;
  objc_super v9;

  -[SystemApertureButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("joinButton")))
  {
    v4 = CFSTR("join.call");
LABEL_17:
    accessibilityLocalizedString(v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("cancelButton")))
  {
    v4 = CFSTR("cancel.join.call");
    goto LABEL_17;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("leaveButton")))
  {
    v4 = CFSTR("leave.call");
    goto LABEL_17;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("openMessagesButton")))
  {
    v4 = CFSTR("open.messages");
    goto LABEL_17;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("toggleAudioRouteMenuButton")))
  {
    v4 = CFSTR("audio.route");
    goto LABEL_17;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("toggleMicMenuButton")))
  {
    v4 = CFSTR("mute");
    goto LABEL_17;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("toggleVideoButton")))
  {
    v4 = CFSTR("camera");
    goto LABEL_17;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("shareMenuButton")))
  {
    v4 = CFSTR("share.content");
    goto LABEL_17;
  }
  v9.receiver = self;
  v9.super_class = (Class)SystemApertureButtonAccessibility;
  -[SystemApertureButtonAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v5 = v7;
  }
  else
  {
    -[SystemApertureButtonAccessibility _axGetLabelSubview](self, "_axGetLabelSubview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_18:

  return v5;
}

- (id)accessibilityValue
{
  void *v3;
  __CFString *v4;
  void *v5;

  -[SystemApertureButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("toggleVideoButton")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("toggleMicMenuButton")))
  {
    if (-[SystemApertureButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected")))v4 = CFSTR("on");
    else
      v4 = CFSTR("off");
    accessibilityLocalizedString(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SystemApertureButtonAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[SystemApertureButtonAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  -[SystemApertureButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("toggleVideoButton")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("toggleMicMenuButton")))
  {
    v3 &= ~*MEMORY[0x24BDF7400];
  }

  return v3;
}

- (id)_axGetLabelSubview
{
  return (id)-[SystemApertureButtonAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", objc_opt_class());
}

@end
