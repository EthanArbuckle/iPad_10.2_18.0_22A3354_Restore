@implementation CKInlineReplyChatControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKInlineReplyChatController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKInlineReplyChatController"), CFSTR("_animateOut"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKInlineReplyChatController"), CFSTR("_animateIn:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKInlineReplyChatController"), CFSTR("CKCoreChatController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKCoreChatController"), CFSTR("collectionViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKInlineReplyCollectionViewController"), CFSTR("CKTranscriptCollectionViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptCollectionViewController"), CFSTR("collectionView"), "@", 0);

}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __70__CKInlineReplyChatControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_animateOut");
}

- (void)_animateIn:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)CKInlineReplyChatControllerAccessibility;
  -[CKInlineReplyChatControllerAccessibility _animateIn:](&v14, sel__animateIn_, a3);
  -[CKInlineReplyChatControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("collectionViewController.collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", v4);
    objc_initWeak(&location, self);
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __55__CKInlineReplyChatControllerAccessibility__animateIn___block_invoke;
    v11 = &unk_2501B1CB8;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v5, "_setAccessibilityFrameBlock:", &v8);
    objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0], v8, v9, v10, v11);
    accessibilityLocalizedString(CFSTR("inline.reply.dismiss.transcript"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityLabel:", v6);

    objc_msgSend(v5, "_accessibilitySetAdditionalElementOrderedLast:", 1);
    v15[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilitySetAdditionalElements:", v7);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

double __55__CKInlineReplyChatControllerAccessibility__animateIn___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKeyPath:", CFSTR("collectionViewController.collectionView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;

  return v4;
}

@end
