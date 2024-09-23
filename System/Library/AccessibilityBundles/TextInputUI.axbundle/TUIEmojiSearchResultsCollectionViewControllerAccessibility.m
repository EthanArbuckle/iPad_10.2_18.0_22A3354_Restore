@implementation TUIEmojiSearchResultsCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TUIEmojiSearchResultsCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TUIEmojiSearchResultsCollectionViewController"), CFSTR("setDisplayedEmojis:verbatimSkinTones:animated:"), "v", "@", "B", "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("TUIEmojiSearchResultsCollectionViewController"), CFSTR("UIViewController"));

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUIEmojiSearchResultsCollectionViewControllerAccessibility;
  -[TUIEmojiSearchResultsCollectionViewControllerAccessibility viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[TUIEmojiSearchResultsCollectionViewControllerAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXTimer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

}

- (void)setDisplayedEmojis:(id)a3 verbatimSkinTones:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  objc_super v14;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TUIEmojiSearchResultsCollectionViewControllerAccessibility;
  -[TUIEmojiSearchResultsCollectionViewControllerAccessibility setDisplayedEmojis:verbatimSkinTones:animated:](&v14, sel_setDisplayedEmojis_verbatimSkinTones_animated_, v8, v6, v5);
  -[TUIEmojiSearchResultsCollectionViewControllerAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXTimer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = objc_alloc(MEMORY[0x24BE005F0]);
    v9 = (void *)objc_msgSend(v10, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    objc_msgSend(v9, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    -[TUIEmojiSearchResultsCollectionViewControllerAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v9, CFSTR("AXTimer"));
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __108__TUIEmojiSearchResultsCollectionViewControllerAccessibility_setDisplayedEmojis_verbatimSkinTones_animated___block_invoke;
  v12[3] = &unk_2503B4CB8;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v9, "afterDelay:processBlock:", v12, 0.5);

}

void __108__TUIEmojiSearchResultsCollectionViewControllerAccessibility_setDisplayedEmojis_verbatimSkinTones_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("emojis.found"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithFormat:", v4, objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakOrQueueIfNeeded();

}

@end
