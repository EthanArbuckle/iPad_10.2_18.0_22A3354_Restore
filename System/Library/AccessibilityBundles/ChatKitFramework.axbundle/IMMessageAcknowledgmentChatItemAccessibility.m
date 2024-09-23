@implementation IMMessageAcknowledgmentChatItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("IMMessageAcknowledgmentChatItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("IMMessageAcknowledgmentChatItem"), CFSTR("IMAssociatedMessageChatItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMAssociatedMessageChatItem"), CFSTR("isFromMe"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMAssociatedMessageChatItem"), CFSTR("sender"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMAssociatedMessageChatItem"), CFSTR("tapback"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("IMTapback"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMTapback"), CFSTR("associatedMessageType"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMHandle"), CFSTR("name"), "@", 0);

}

- (id)accessibilityLabel
{
  if (-[IMMessageAcknowledgmentChatItemAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isFromMe")))-[IMMessageAcknowledgmentChatItemAccessibility _axLabelForAcknowledgmentFromYou](self, "_axLabelForAcknowledgmentFromYou");
  else
    -[IMMessageAcknowledgmentChatItemAccessibility _axLabelForAcknowledgmentFromSomeone](self, "_axLabelForAcknowledgmentFromSomeone");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_axLabelForAcknowledgmentFromYou
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[IMMessageAcknowledgmentChatItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tapback"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v2, "safeUnsignedIntegerForKey:", CFSTR("associatedMessageType")))
  {
    case 2000:
      v3 = CFSTR("acknowledgment.you.loved");
      goto LABEL_9;
    case 2001:
      v3 = CFSTR("acknowledgment.you.liked");
      goto LABEL_9;
    case 2002:
      v3 = CFSTR("acknowledgment.you.disliked");
      goto LABEL_9;
    case 2003:
      v3 = CFSTR("acknowledgment.you.laughed");
      goto LABEL_9;
    case 2004:
      v3 = CFSTR("acknowledgment.you.emphasized");
      goto LABEL_9;
    case 2005:
      v3 = CFSTR("acknowledgment.you.questioned");
LABEL_9:
      accessibilityLocalizedString(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2006:
      v5 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("acknowledgment.you.generic"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "safeStringForKey:", CFSTR("associatedMessageEmoji"));
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 2007:
      v5 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("acknowledgment.you.generic"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      accessibilityLocalizedString(CFSTR("default.tapback"));
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v8 = (void *)v7;
      objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v4 = 0;
      break;
  }

  return v4;
}

- (id)_axLabelForAcknowledgmentFromSomeone
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  -[IMMessageAcknowledgmentChatItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sender"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMMessageAcknowledgmentChatItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tapback"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v5, "safeUnsignedIntegerForKey:", CFSTR("associatedMessageType")))
  {
    case 2000:
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = CFSTR("acknowledgment.someone.loved");
      goto LABEL_9;
    case 2001:
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = CFSTR("acknowledgment.someone.liked");
      goto LABEL_9;
    case 2002:
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = CFSTR("acknowledgment.someone.disliked");
      goto LABEL_9;
    case 2003:
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = CFSTR("acknowledgment.someone.laughed");
      goto LABEL_9;
    case 2004:
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = CFSTR("acknowledgment.someone.emphasized");
      goto LABEL_9;
    case 2005:
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = CFSTR("acknowledgment.someone.questioned");
LABEL_9:
      accessibilityLocalizedString(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringWithFormat:", v9, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 2006:
      v10 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("acknowledgment.someone.generic"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safeStringForKey:", CFSTR("associatedMessageEmoji"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v9, v4, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 2007:
      v13 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("acknowledgment.someone.generic"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      accessibilityLocalizedString(CFSTR("default.tapback"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringWithFormat:", v9, v4, v11);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v8 = (void *)v12;

LABEL_13:
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

@end
