@implementation ConversationControlsButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.ConversationControlsButton");
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

  -[ConversationControlsButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
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
  v9.super_class = (Class)ConversationControlsButtonAccessibility;
  -[ConversationControlsButtonAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v5 = v7;
  }
  else
  {
    -[ConversationControlsButtonAccessibility _axGetLabelSubview](self, "_axGetLabelSubview");
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

  -[ConversationControlsButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("toggleVideoButton")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("toggleMicMenuButton")))
  {
    if (-[ConversationControlsButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected")))v4 = CFSTR("on");
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
  v6.super_class = (Class)ConversationControlsButtonAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[ConversationControlsButtonAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  -[ConversationControlsButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("toggleVideoButton")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("toggleMicMenuButton")))
  {
    v3 &= ~*MEMORY[0x24BDF7400];
  }

  return v3;
}

- (id)accessibilityPath
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGAffineTransform v12;
  CGAffineTransform v13;
  objc_super v14;

  -[ConversationControlsButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)ConversationControlsButtonAccessibility;
  -[ConversationControlsButtonAccessibility accessibilityPath](&v14, sel_accessibilityPath);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("joinButton")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("leaveButton")))
  {
    objc_msgSend(v4, "bounds");
    AX_CGRectGetCenter();
    v6 = v5;
    v8 = v7;
    CGAffineTransformMakeScale(&v13, 1.3, 1.3);
    objc_msgSend(v4, "applyTransform:", &v13);
    objc_msgSend(v4, "bounds");
    AX_CGRectGetCenter();
    CGAffineTransformMakeTranslation(&v12, v6 - v9, v8 - v10);
    objc_msgSend(v4, "applyTransform:", &v12);
  }

  return v4;
}

- (id)_axGetLabelSubview
{
  return (id)-[ConversationControlsButtonAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", objc_opt_class());
}

@end
