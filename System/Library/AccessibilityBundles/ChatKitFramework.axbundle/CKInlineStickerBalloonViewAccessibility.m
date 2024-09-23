@implementation CKInlineStickerBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKInlineStickerBalloonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKInlineStickerBalloonView"), CFSTR("CKBalloonImageView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBalloonImageView"), CFSTR("stickerAccessibilityDescription"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  if (-[CKInlineStickerBalloonViewAccessibility _axIsAttachedToOutgoingMessage](self, "_axIsAttachedToOutgoingMessage"))
  {
    -[CKInlineStickerBalloonViewAccessibility _axBalloonContentDescription](self, "_axBalloonContentDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("sticker.attached"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    __UIAccessibilityCastAsSafeCategory();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_axMessageSender");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInlineStickerBalloonViewAccessibility _axBalloonContentDescription](self, "_axBalloonContentDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_axStickerDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_axAcknowledgmentDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_axMessageTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)accessibilityCustomActions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[CKInlineStickerBalloonViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXPluginClearActionProvider"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    accessibilityLocalizedString(CFSTR("app.browser.clear.action.name"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v3, v2, sel__accessibilityClearPlugin);
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
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
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKInlineStickerBalloonViewAccessibility;
  v3 = -[CKInlineStickerBalloonViewAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  if (-[CKInlineStickerBalloonViewAccessibility _axIsAttachedToOutgoingMessage](self, "_axIsAttachedToOutgoingMessage"))
    v4 = ~*MEMORY[0x24BDF73B0];
  else
    v4 = -1;
  return v4 & v3;
}

- (id)_axBalloonContentDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CKInlineStickerBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("stickerAccessibilityDescription"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("sticker.label.format"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithFormat:", v4, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    accessibilityLocalizedString(CFSTR("sticker.unknown"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)_axIsAttachedToOutgoingMessage
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_axChatItemForBalloon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

@end
