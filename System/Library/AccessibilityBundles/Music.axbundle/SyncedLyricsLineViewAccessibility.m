@implementation SyncedLyricsLineViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicCoreUI.SyncedLyricsLineView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MusicCoreUI.SyncedLyricsLineView"), CFSTR("UIControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIControl"), CFSTR("isSelected"), "B", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicCoreUI.SyncedLyricsLineView"), CFSTR("containerView"), "UIView");
  objc_msgSend(v3, "validateClass:", CFSTR("MusicTextContentView"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicTextContentView"), CFSTR("label"), "UILabel");
  objc_msgSend(v3, "validateClass:", CFSTR("MusicSBS_TextContentView"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicSBS_TextContentView"), CFSTR("text"), "Optional<String>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicSBS_TextContentView"), CFSTR("attributedText"), "Optional<NSAttributedString>");
  objc_msgSend(v3, "validateClass:", CFSTR("MusicInstrumentalContentView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicCoreUI.SyncedLyricsLineView"), CFSTR("setSelected:animator:"), "v", "B", "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73B0];
  v3 = -[SyncedLyricsLineViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected"));
  v4 = *MEMORY[0x24BDF7400];
  if (!v3)
    v4 = 0;
  return v4 | v2;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  objc_opt_class();
  -[SyncedLyricsLineViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("containerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_accessibilityDescendantOfType:", MEMORY[0x234917228](CFSTR("MusicSBS_TextContentView")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "safeSwiftValueForKey:", CFSTR("text"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v8 = v7;
      v9 = v8;
      goto LABEL_11;
    }
    objc_opt_class();
    objc_msgSend(v6, "safeSwiftValueForKey:", CFSTR("attributedText"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "string");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v4, "_accessibilityDescendantOfType:", MEMORY[0x234917228](CFSTR("MusicTextContentView")));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_6;
  objc_opt_class();
  objc_msgSend(v8, "safeSwiftValueForKey:", CFSTR("label"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_6:
    objc_msgSend(v4, "_accessibilityDescendantOfType:", MEMORY[0x234917228](CFSTR("MusicInstrumentalContentView")));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v9 = 0;
      goto LABEL_10;
    }
    accessibilityMusicLocalizedString(CFSTR("instrumental.break"));
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v9 = (void *)v13;
LABEL_10:

  }
LABEL_11:

  return v9;
}

- (BOOL)_accessibilityShouldIncludeMediaDescriptionsRotor
{
  return 1;
}

- (void)setSelected:(BOOL)a3 animator:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)SyncedLyricsLineViewAccessibility;
  -[SyncedLyricsLineViewAccessibility setSelected:animator:](&v9, sel_setSelected_animator_, a3, a4);
  -[SyncedLyricsLineViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = *MEMORY[0x24BDFEE78];
    v10 = v5;
    v11 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    UIAccessibilityPostNotification(0x42Cu, v8);
  }

}

@end
