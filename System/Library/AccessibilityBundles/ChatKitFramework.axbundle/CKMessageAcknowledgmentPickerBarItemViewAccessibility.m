@implementation CKMessageAcknowledgmentPickerBarItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKMessageAcknowledgmentPickerBarItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageAcknowledgmentPickerBarItemView"), CFSTR("messageAcknowledgmentType"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageAcknowledgmentPickerBarItemView"), CFSTR("isSelected"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageAcknowledgmentPickerBarItemView"), CFSTR("itemButtonTapped:"), "v", "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKMessageAcknowledgmentPickerBarItemViewAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[CKMessageAcknowledgmentPickerBarItemViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[CKMessageAcknowledgmentPickerBarItemViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected"));
  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v3 | v5;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("acknowledgment.hint"));
}

- (BOOL)accessibilityActivate
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __78__CKMessageAcknowledgmentPickerBarItemViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "itemButtonTapped:", 0);
}

- (id)_accessibilityLabelForAcknowledgmentType
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  void *v5;

  -[CKMessageAcknowledgmentPickerBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("messageAcknowledgmentType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  v4 = CFSTR("acknowledgment.type.heart");
  switch(v3)
  {
    case 2000:
      goto LABEL_9;
    case 2001:
LABEL_4:
      v4 = CFSTR("acknowledgment.type.thumbs.up");
      goto LABEL_9;
    case 2002:
LABEL_5:
      v4 = CFSTR("acknowledgment.type.thumbs.down");
      goto LABEL_9;
    case 2003:
LABEL_6:
      v4 = CFSTR("acknowledgment.type.ha");
      goto LABEL_9;
    case 2004:
LABEL_7:
      v4 = CFSTR("acknowledgment.type.exclamation");
      goto LABEL_9;
    case 2005:
LABEL_8:
      v4 = CFSTR("acknowledgment.type.question.mark");
LABEL_9:
      accessibilityLocalizedString(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      switch(v3)
      {
        case 3000:
          goto LABEL_9;
        case 3001:
          goto LABEL_4;
        case 3002:
          goto LABEL_5;
        case 3003:
          goto LABEL_6;
        case 3004:
          goto LABEL_7;
        case 3005:
          goto LABEL_8;
        default:
          v5 = 0;
          break;
      }
      break;
  }
  return v5;
}

@end
