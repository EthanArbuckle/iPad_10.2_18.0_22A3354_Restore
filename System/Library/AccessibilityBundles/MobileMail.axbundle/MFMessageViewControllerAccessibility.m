@implementation MFMessageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFMessageViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMessageViewController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewControllerBase"), CFSTR("collectionView"), "@", 0);

}

- (void)messageContentView:(id)a3 didFinishRenderingWithHeight:(double)a4
{
  void *v6;
  void *v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFMessageViewControllerAccessibility;
  -[MFMessageViewControllerAccessibility messageContentView:didFinishRenderingWithHeight:](&v9, sel_messageContentView_didFinishRenderingWithHeight_, a3);
  -[MFMessageViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("_MFConversationViewCollectionView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (double)objc_msgSend(v7, "_axHeightOfCellsToLoad");
    if (v8 < a4)
      objc_msgSend(v7, "_axSetHeightOfCellsToLoad:", (uint64_t)a4, v8);
  }

}

@end
