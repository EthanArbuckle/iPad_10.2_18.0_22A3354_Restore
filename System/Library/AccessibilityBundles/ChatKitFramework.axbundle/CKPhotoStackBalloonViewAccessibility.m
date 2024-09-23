@implementation CKPhotoStackBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKPhotoStackBalloonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAggregateAttachmentMessagePartChatItem"), CFSTR("aggregateChatItems"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKPhotoStackBalloonView"), CFSTR("CKGenericPhotoStackBalloonView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKGenericPhotoStackBalloonView"), CFSTR("stackView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessagePartChatItem"), CFSTR("visibleAssociatedMessageChatItems"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKAggregateAcknowledgmentChatItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXMessagesStackItemsLayout"), CFSTR("primaryItemIndex"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXMessagesStackView"), CFSTR("currentAssetReference"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PXMessagesStackView"), CFSTR("PXBaseMessagesStackView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXBaseMessagesStackView"), CFSTR("_layout"), "PXMessagesStackItemsLayout");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXAssetReference"), CFSTR("asset"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMediaObjectBackedAsset"), CFSTR("playbackStyle"), "q", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;

  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPhotoStackBalloonViewAccessibility _axChatItemForBalloon](self, "_axChatItemForBalloon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeArrayForKey:", CFSTR("aggregateChatItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKPhotoStackBalloonViewAccessibility _accessibilityStackView](self, "_accessibilityStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("layout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "safeIntegerForKey:", CFSTR("primaryItemIndex"));

  v9 = 0;
  if (v8 < objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndex:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeArrayForKey:", CFSTR("visibleAssociatedMessageChatItems"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ax_filteredArrayUsingBlock:", &__block_literal_global_849);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13 = objc_msgSend(v5, "count");
  v14 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("attachment.count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringWithFormat:", v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_axMessageSender");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_axReplyDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_axStickerDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_axMessageTime");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

uint64_t __58__CKPhotoStackBalloonViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("CKAggregateAcknowledgmentChatItem"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  -[CKPhotoStackBalloonViewAccessibility _axChatItemForBalloon](self, "_axChatItemForBalloon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("aggregateChatItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count");
  -[CKPhotoStackBalloonViewAccessibility _accessibilityStackView](self, "_accessibilityStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("layout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "safeIntegerForKey:", CFSTR("primaryItemIndex"));

  -[CKPhotoStackBalloonViewAccessibility _accessibilityStackView](self, "_accessibilityStackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeValueForKeyPath:", CFSTR("currentAssetReference.asset"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "safeIntegerForKey:", CFSTR("playbackStyle")) == 4)
    v11 = CFSTR("video.attachment");
  else
    v11 = CFSTR("image.attachment");
  accessibilityLocalizedString(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8 + 1;
  v14 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("messages.attachment.stack.view.format"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringWithFormat:", v15, v13, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0] | *MEMORY[0x24BDF73A0];
}

- (void)accessibilityIncrement
{
  id v2;

  -[CKPhotoStackBalloonViewAccessibility _accessibilityStackView](self, "_accessibilityStackView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityIncrement");

}

- (void)accessibilityDecrement
{
  id v2;

  -[CKPhotoStackBalloonViewAccessibility _accessibilityStackView](self, "_accessibilityStackView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityDecrement");

}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[CKPhotoStackBalloonViewAccessibility _accessibilityStackView](self, "_accessibilityStackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)CKPhotoStackBalloonViewAccessibility;
  -[CKPhotoStackBalloonViewAccessibility accessibilityCustomActions](&v8, sel_accessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[CKPhotoStackBalloonViewAccessibility _accessibilityStackView](self, "_accessibilityStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityCustomActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v6);

  return v3;
}

- (id)_accessibilityStackView
{
  return (id)-[CKPhotoStackBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("stackView"));
}

@end
