@implementation HOAddLocationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HOAddLocationViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HOAddLocationViewController"), CFSTR("tableView: cellForRowAtIndexPath: rowIdentifier:"), "@", "@", "@", 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 rowIdentifer:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HOAddLocationViewControllerAccessibility;
  v7 = a5;
  -[HOAddLocationViewControllerAccessibility tableView:cellForRowAtIndexPath:rowIdentifer:](&v11, sel_tableView_cellForRowAtIndexPath_rowIdentifer_, a3, a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v7, "isEqualToString:", HOAddLocationWallpaperSectionRowThumbnail, v11.receiver, v11.super_class);

  if ((_DWORD)a3)
  {
    accessibilityLocalizedString(CFSTR("setup.wallpaper.preview.cell"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v9);

  }
  return v8;
}

@end
