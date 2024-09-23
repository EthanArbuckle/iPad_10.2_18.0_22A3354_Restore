@implementation PXStoryViewModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXStoryViewModel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXStoryViewModel"), CFSTR("setWantsRelatedOverlayVisible:"), "v", "B", 0);
}

- (void)setWantsRelatedOverlayVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryViewModelAccessibility;
  -[PXStoryViewModelAccessibility setWantsRelatedOverlayVisible:](&v9, sel_setWantsRelatedOverlayVisible_);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDFEA60];
    accessibilityPhotosUICoreLocalizedString(CFSTR("watch.next.memories"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "axAttributedStringWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setAttribute:forKey:", &unk_24FF146D0, *MEMORY[0x24BDFEAD8]);
    v8 = v6;
    v7 = v6;
    AXPerformBlockOnMainThreadAfterDelay();

  }
}

void __63__PXStoryViewModelAccessibility_setWantsRelatedOverlayVisible___block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], *(id *)(a1 + 32));
}

@end
