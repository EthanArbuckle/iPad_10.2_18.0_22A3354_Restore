@implementation VMMessageTranscriptViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VMMessageTranscriptView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VMMessageTranscriptView"), CFSTR("openFeedbackURL:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VMMessageTranscriptView"), CFSTR("_feedbackTextView"), "UITextView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VMMessageTranscriptView"), CFSTR("_textView"), "UITextView");

}

- (BOOL)_accessibilityActivateTextViewLink:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  VMMessageTranscriptViewAccessibility *v21;
  id v22;

  v4 = a3;
  objc_msgSend(v4, "accessibilityContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMMessageTranscriptViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_feedbackTextView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __75__VMMessageTranscriptViewAccessibility__accessibilityActivateTextViewLink___block_invoke;
    v20 = &unk_250290700;
    v21 = self;
    v22 = v4;
    AXPerformSafeBlock();

    v11 = 1;
  }
  else
  {
    objc_msgSend(v4, "accessibilityContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessibilityContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMMessageTranscriptViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v10)
    {
      -[VMMessageTranscriptViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_textView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BDD1968];
      objc_msgSend(v4, "accessibilityActivationPoint");
      objc_msgSend(v13, "valueWithPoint:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v12, "_accessibilityShowContextMenuWithTargetPointValue:", v14);

    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)VMMessageTranscriptViewAccessibility;
      v11 = -[VMMessageTranscriptViewAccessibility _accessibilityActivateTextViewLink:](&v16, sel__accessibilityActivateTextViewLink_, v4);
    }
  }

  return v11;
}

void __75__VMMessageTranscriptViewAccessibility__accessibilityActivateTextViewLink___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "url");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openFeedbackURL:", v2);

}

@end
