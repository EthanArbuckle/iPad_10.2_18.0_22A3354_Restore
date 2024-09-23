@implementation CKStickerDetailViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKStickerDetailViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKStickerDetailViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKStickerDetailViewController"), CFSTR("chatItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKStickerDetailViewController"), CFSTR("tableView:cellForRowAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKAssociatedStickerChatItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAssociatedStickerChatItem"), CFSTR("mediaObject"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKMediaObject"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMediaObject"), CFSTR("transfer"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("CKFileTransfer"), CFSTR("attributionInfo"));

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CKStickerDetailViewControllerAccessibility;
  -[CKStickerDetailViewControllerAccessibility tableView:cellForRowAtIndexPath:](&v16, sel_tableView_cellForRowAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CKStickerDetailCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKStickerDetailViewControllerAccessibility _axChatItemForIndex:](self, "_axChatItemForIndex:", objc_msgSend(v7, "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeValueForKey:", CFSTR("mediaObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeValueForKey:", CFSTR("transfer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safeDictionaryForKey:", CFSTR("attributionInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("accessl"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    __UIAccessibilityCastAsSafeCategory();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_axSetStickerDescription:", v13);

  }
  return v8;
}

- (id)_axChatItemForIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[CKStickerDetailViewControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("chatItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
