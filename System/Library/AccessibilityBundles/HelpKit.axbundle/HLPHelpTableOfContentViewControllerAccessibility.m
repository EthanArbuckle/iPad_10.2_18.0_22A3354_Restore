@implementation HLPHelpTableOfContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HLPHelpTableOfContentViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HLPHelpTableOfContentViewController"), CFSTR("_copyrightFooterLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HLPHelpTableOfContentViewController"), CFSTR("_footerViewOverlayButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HLPHelpTableOfContentViewController"), CFSTR("helpBookController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HLPHelpBookController"), CFSTR("copyrightTopicIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HLPHelpTableOfContentViewController"), CFSTR("updateWithHelpBookController:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HLPHelpBookController"), CFSTR("helpTopicItemForID:"), "@", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HLPHelpTableOfContentViewControllerAccessibility;
  -[HLPHelpTableOfContentViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v16, sel__accessibilityLoadAccessibilityInformation);
  -[HLPHelpTableOfContentViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_copyrightFooterLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPHelpTableOfContentViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_footerViewOverlayButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);
  objc_msgSend(v3, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  -[HLPHelpTableOfContentViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("helpBookController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v9 = MEMORY[0x24BDAC760];
  v7 = v6;
  AXPerformSafeBlock();
  v8 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  if (!v8)
    objc_msgSend(v4, "_accessibilityRemoveTrait:", *MEMORY[0x24BDF73B0], v9, 3221225472, __94__HLPHelpTableOfContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke, &unk_250231FE8);

}

void __94__HLPHelpTableOfContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "safeStringForKey:", CFSTR("copyrightTopicIdentifier"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "helpTopicItemForID:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)updateWithHelpBookController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HLPHelpTableOfContentViewControllerAccessibility;
  -[HLPHelpTableOfContentViewControllerAccessibility updateWithHelpBookController:](&v4, sel_updateWithHelpBookController_, a3);
  -[HLPHelpTableOfContentViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
