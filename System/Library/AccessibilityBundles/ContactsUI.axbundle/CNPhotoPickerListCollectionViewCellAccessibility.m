@implementation CNPhotoPickerListCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPhotoPickerListCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:conformsToProtocol:", CFSTR("CNPhotoPickerListCollectionViewCell"), CFSTR("UITableViewDelegate"));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNPhotoPickerListCollectionViewCellAccessibility;
  -[CNPhotoPickerListCollectionViewCellAccessibility tableView:cellForRowAtIndexPath:](&v7, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessibilityTraits");
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | v5);
  return v4;
}

@end
