@implementation CKGroupAcknowledgmentVotingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKGroupAcknowledgmentVotingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKGroupAcknowledgmentVotingViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKGroupAcknowledgmentVotingViewController"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKGroupAcknowledgmentVotingViewController"), CFSTR("tallies"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKGroupAcknowledgmentVotingViewController"), CFSTR("collapseButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKGroupAcknowledgmentVotingViewController"), CFSTR("collectionView:cellForItemAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKGroupAcknowledgmentVotingViewController"), CFSTR("collectionView:viewForSupplementaryElementOfKind:atIndexPath:"), "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKGroupAcknowledgmentVotingViewController"), CFSTR("_animateToLayout:aroundSection:"), "v", "Q", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKGroupAcknowledgmentVotingViewController"), CFSTR("acknowledgmentVotingViewAnimatorDidFinishAnimation:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKAvatarContactNameCollectionReusableView"));
  objc_msgSend(v3, "validateClass:", CFSTR("CKAcknowledgmentIconCollectionReusableView"));
  objc_msgSend(v3, "validateClass:", CFSTR("CKAcknowledgmentVoteCountCollectionReusableView"));

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKGroupAcknowledgmentVotingViewControllerAccessibility;
  -[CKGroupAcknowledgmentVotingViewControllerAccessibility viewDidLoad](&v5, sel_viewDidLoad);
  -[CKGroupAcknowledgmentVotingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("collection.acknowledgments.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (id)collapseButton
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKGroupAcknowledgmentVotingViewControllerAccessibility;
  -[CKGroupAcknowledgmentVotingViewControllerAccessibility collapseButton](&v5, sel_collapseButton);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("acknowledgment.collapse.button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKGroupAcknowledgmentVotingViewControllerAccessibility;
  -[CKGroupAcknowledgmentVotingViewControllerAccessibility collectionView:cellForItemAtIndexPath:](&v13, sel_collectionView_cellForItemAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsAccessibilityElement:", 1);
  objc_opt_class();
  -[CKGroupAcknowledgmentVotingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tallies"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "section"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_accessibilitySetAssignedValue:forKey:", v11, CFSTR("AXTapbackTally"));
  objc_msgSend(v8, "_accessibilitySetIntegerValue:forKey:", objc_msgSend(v7, "item"), CFSTR("AXTapbackContactIndex"));

  return v8;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKGroupAcknowledgmentVotingViewControllerAccessibility;
  -[CKGroupAcknowledgmentVotingViewControllerAccessibility collectionView:viewForSupplementaryElementOfKind:atIndexPath:](&v7, sel_collectionView_viewForSupplementaryElementOfKind_atIndexPath_, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", 0);
  objc_msgSend(v5, "setAccessibilityElementsHidden:", 1);
  return v5;
}

- (void)_animateToLayout:(unint64_t)a3 aroundSection:(int64_t)a4
{
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKGroupAcknowledgmentVotingViewControllerAccessibility;
  -[CKGroupAcknowledgmentVotingViewControllerAccessibility _animateToLayout:aroundSection:](&v12, sel__animateToLayout_aroundSection_);
  objc_opt_class();
  -[CKGroupAcknowledgmentVotingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 1)
    v9 = 0;
  else
    v9 = a4;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForItemAtIndexPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v8, "scrollToItemAtIndexPath:atScrollPosition:animated:", v10, 16, 0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v11);

}

- (void)acknowledgmentVotingViewAnimatorDidFinishAnimation:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKGroupAcknowledgmentVotingViewControllerAccessibility;
  -[CKGroupAcknowledgmentVotingViewControllerAccessibility acknowledgmentVotingViewAnimatorDidFinishAnimation:](&v3, sel_acknowledgmentVotingViewAnimatorDidFinishAnimation_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
