@implementation DOCTagCheckableDotViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DOCTagCheckableDotView");
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
  uint64_t v2;
  void *v3;
  void *v4;

  switch(-[DOCTagCheckableDotViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("tagColor")))
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
      v2 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      objc_msgSend(MEMORY[0x24BDF6950], "systemGreenColor");
      v2 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      objc_msgSend(MEMORY[0x24BDF6950], "systemPurpleColor");
      v2 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
      objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
      v2 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5:
      objc_msgSend(MEMORY[0x24BDF6950], "systemYellowColor");
      v2 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 6:
      objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
      v2 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 7:
      objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
      v2 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v3 = (void *)v2;
      if (!v2)
        goto LABEL_11;
      AXColorStringForColor();
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
LABEL_11:
      accessibilityLocalizedString(CFSTR("tag.no.color"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v4;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73B0];
  v3 = -[DOCTagCheckableDotViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("checked"));
  v4 = *MEMORY[0x24BDF7400];
  if (!v3)
    v4 = 0;
  return v4 | v2;
}

@end
