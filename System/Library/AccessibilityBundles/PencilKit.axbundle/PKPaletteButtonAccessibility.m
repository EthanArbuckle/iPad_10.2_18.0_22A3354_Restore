@implementation PKPaletteButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaletteButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v7;

  -[PKPaletteButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Scribble-UCB-Undo-Button")))
  {
    v4 = CFSTR("pkpalettebutton.undo");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Scribble-UCB-Redo-Button")))
  {
    v4 = CFSTR("pkpalettebutton.redo");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Scribble-UCB-More-Button")))
  {
    v4 = CFSTR("pkpalettebutton.more");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Scribble-UCB-Plus-Button")))
  {
    v4 = CFSTR("pkpalettebutton.plus");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Scribble-UCB-Keyboard-Button")))
  {
    v4 = CFSTR("pkpalettebutton.keyboard");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Scribble-UCB-Emoji-Button")))
  {
    v4 = CFSTR("pkpalettebutton.emoji");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Scribble-UCB-Small-Return-Button")))
    {
      -[PKPaletteButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("button"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accessibilityLabel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
    v4 = CFSTR("pkpalettebutton.return");
  }
  accessibilityPencilKitLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaletteButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PKPaletteButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
