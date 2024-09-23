@implementation CKMentionsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKMentionsController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMentionsController"), CFSTR("setShowMentionSuggestions:animated:completion:"), "v", "B", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMentionsController"), CFSTR("paddleOverlayView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMentionsController"), CFSTR("currentMentionSuggestions"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMentionsController"), CFSTR("mentionSuggestionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMentionSuggestionView"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMentionsController"), CFSTR("textView"), "@", 0);

}

- (void)setShowMentionSuggestions:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CKMentionsControllerAccessibility;
  -[CKMentionsControllerAccessibility setShowMentionSuggestions:animated:completion:](&v20, sel_setShowMentionSuggestions_animated_completion_, v6, v5, v8);
  -[CKMentionsControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("currentMentionSuggestions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    LOBYTE(location) = 0;
    objc_opt_class();
    -[CKMentionsControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mentionSuggestionView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeValueForKey:", CFSTR("collectionView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "numberOfSections") >= 1 && objc_msgSend(v12, "numberOfItemsInSection:", 0) >= 1)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cellForItemAtIndexPath:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v14);
    }

  }
  -[CKMentionsControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("textView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v6)
  {
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __83__CKMentionsControllerAccessibility_setShowMentionSuggestions_animated_completion___block_invoke;
    v17[3] = &unk_2501B1C70;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v16, "_setAccessibilityPerformEscapeBlock:", v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v15, "_setAccessibilityPerformEscapeBlock:", 0);
  }

}

uint64_t __83__CKMentionsControllerAccessibility_setShowMentionSuggestions_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;

  objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("paddleOverlayView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dismiss");
  return 1;
}

@end
