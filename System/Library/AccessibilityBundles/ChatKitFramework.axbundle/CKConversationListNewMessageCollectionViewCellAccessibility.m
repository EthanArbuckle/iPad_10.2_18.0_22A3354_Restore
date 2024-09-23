@implementation CKConversationListNewMessageCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKConversationListNewMessageCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKConversationListNewMessageCollectionViewCell"), CFSTR("CKConversationListEmbeddedCollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListNewMessageCollectionViewCell"), CFSTR("embeddedNewMessageTableViewCell"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKConversationListEmbeddedNewMessageTableViewCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("text"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[CKConversationListNewMessageCollectionViewCellAccessibility _axEmbeddedTableViewCell](self, "_axEmbeddedTableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axEmbeddedTableViewCell
{
  return (id)-[CKConversationListNewMessageCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("embeddedNewMessageTableViewCell"));
}

@end
