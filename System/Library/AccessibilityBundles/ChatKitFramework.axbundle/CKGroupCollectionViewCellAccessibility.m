@implementation CKGroupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKGroupCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("UILayoutContainerView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKTranscriptCollectionView"), CFSTR("UICollectionView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptCollectionViewController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKInlineReplyChatController"), CFSTR("CKCoreChatController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKChatController"), CFSTR("CKCoreChatController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKDetailsController"), CFSTR("UIViewController"));

}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  BOOL v9;
  objc_super v11;

  -[CKGroupCollectionViewCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("UILayoutContainerView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityDescendantOfType:", NSClassFromString(CFSTR("CKTranscriptCollectionView")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "accessibilityPerformEscape");
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CKGroupCollectionViewCellAccessibility;
    v8 = -[CKGroupCollectionViewCellAccessibility accessibilityPerformEscape](&v11, sel_accessibilityPerformEscape);
  }
  v9 = v8;

  return v9;
}

@end
