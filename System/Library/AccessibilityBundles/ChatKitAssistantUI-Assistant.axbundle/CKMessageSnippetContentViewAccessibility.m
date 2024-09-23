@implementation CKMessageSnippetContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKMessageSnippetContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[CKMessageSnippetContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_toLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessageSnippetContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_balloonImageView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("attributedText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("string"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_msgSend(v7, "isEqualToString:", CFSTR(" ")) & 1) == 0)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    accessibilityAssistantLocalizedString(CFSTR("message.snippet.message"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v9, v7);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setBalloonType:(int64_t)a3
{
  __CFString *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKMessageSnippetContentViewAccessibility;
  -[CKMessageSnippetContentViewAccessibility setBalloonType:](&v7, sel_setBalloonType_);
  if (a3 == 1)
    v5 = CFSTR("message.snippet.status.sent");
  else
    v5 = CFSTR("message.snippet.status.unsent");
  accessibilityAssistantLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageSnippetContentViewAccessibility setAccessibilityValue:](self, "setAccessibilityValue:", v6);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
