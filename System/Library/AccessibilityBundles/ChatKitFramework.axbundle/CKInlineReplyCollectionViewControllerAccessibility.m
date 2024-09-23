@implementation CKInlineReplyCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKInlineReplyCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKInlineReplyCollectionViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CKInlineReplyCollectionViewController"), CFSTR("collectionView"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKInlineReplyCollectionViewController"), CFSTR("setCollectionViewCurrentFramesForNextLayout:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKInlineReplyCollectionViewControllerAccessibility;
  -[CKInlineReplyCollectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[CKInlineReplyCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("group.reply.collection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKInlineReplyCollectionViewControllerAccessibility;
  -[CKInlineReplyCollectionViewControllerAccessibility viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  v4 = *MEMORY[0x24BDF7328];
  -[CKInlineReplyCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v5);

}

- (void)setCollectionViewCurrentFramesForNextLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKInlineReplyCollectionViewControllerAccessibility;
  -[CKInlineReplyCollectionViewControllerAccessibility setCollectionViewCurrentFramesForNextLayout:](&v9, sel_setCollectionViewCurrentFramesForNextLayout_, v4);
  objc_opt_class();
  -[CKInlineReplyCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "visibleCells");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], v8);
}

@end
