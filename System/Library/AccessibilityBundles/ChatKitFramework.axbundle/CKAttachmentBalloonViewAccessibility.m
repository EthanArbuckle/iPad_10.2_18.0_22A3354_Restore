@implementation CKAttachmentBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKAttachmentBalloonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMediaObject"), CFSTR("UTIType"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMediaObject"), CFSTR("mediaType"), "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAttachmentBalloonView"), CFSTR("attachmentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAttachmentBalloonView"), CFSTR("mediaObject"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;

  -[CKAttachmentBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("attachmentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAttachmentBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mediaObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("UTIType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = 1;
  _AXLogWithFacility();
  _AXCKStringForMediaType(objc_msgSend(v4, "safeIntForKey:", CFSTR("mediaType"), v17, CFSTR("icon: %@"), v19));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("attachment.with.type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_axMessageSender", v3, CFSTR("__AXStringForVariablesSentinel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_axReplyDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_axStickerDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_axAcknowledgmentDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_axMessageTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
