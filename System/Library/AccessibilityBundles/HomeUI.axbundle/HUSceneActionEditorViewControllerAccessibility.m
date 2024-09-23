@implementation HUSceneActionEditorViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUSceneActionEditorViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUSceneActionEditorViewController"), CFSTR("setupCell:forItem:indexPath:"), "v", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUSceneActionEditorViewController"), CFSTR("HUItemTableViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUItemTableViewController"), CFSTR("itemManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUSceneActionEditorItemManager"), CFSTR("nameAndIconItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUNameAndIconEditorCell"), CFSTR("iconButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUNameAndIconEditorCell"), CFSTR("textField"), "@", 0);

}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HUSceneActionEditorViewControllerAccessibility;
  v9 = a4;
  -[HUSceneActionEditorViewControllerAccessibility setupCell:forItem:indexPath:](&v15, sel_setupCell_forItem_indexPath_, v8, v9, a5);
  -[HUSceneActionEditorViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("itemManager.nameAndIconItem"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v9)
  {
    v11 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(v8, "safeValueForKey:", CFSTR("iconButton"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeValueForKey:", CFSTR("textField"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "axArrayByIgnoringNilElementsWithCount:", 2, v12, v13, v15.receiver, v15.super_class);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityElements:", v14);

  }
  else
  {
    objc_msgSend(v8, "setAccessibilityElements:", 0);
  }

}

@end
