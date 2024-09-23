@implementation PREditingPickerImageCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PREditingPickerImageCellView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditingPickerImageCellView"), CFSTR("contentImageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageView"), CFSTR("image"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UIImage"), CFSTR("_imageAsset"), "UIImageAsset");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageAsset"), CFSTR("assetName"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  -[PREditingPickerImageCellViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)PREditingPickerImageCellViewAccessibility;
  -[PREditingPickerImageCellViewAccessibility accessibilityLabel](&v11, sel_accessibilityLabel);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("image"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("_imageAsset"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeStringForKey:", CFSTR("assetName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PREditingPickerImageCellViewAccessibility _axLabelForSymbolName:](self, "_axLabelForSymbolName:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }

  return v4;
}

- (id)_axLabelForSymbolName:(id)a3
{
  id v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("banner.horizontal.filled.top.iphone")))
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("banner.vertical.filled.topright.iphone"))
      || objc_msgSend(v3, "isEqualToString:", CFSTR("textbox.vertical.filled.topright.iphone"))
      || objc_msgSend(v3, "isEqualToString:", CFSTR("textbox.vertical.filled.topright.ipad"))
      || objc_msgSend(v3, "isEqualToString:", CFSTR("textbox.vertical.filled.topright.ipad.landscape")))
    {
      v4 = CFSTR("title.layout.vertical");
      goto LABEL_8;
    }
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("textbox.horizontal.filled.top.iphone"))
      && !objc_msgSend(v3, "isEqualToString:", CFSTR("textbox.horizontal.filled.top.ipad"))
      && !objc_msgSend(v3, "isEqualToString:", CFSTR("textbox.horizontal.filled.top.ipad.landscape")))
    {
      accessibilityUIKitSymbolNamesLocalizedString();
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  v4 = CFSTR("title.layout.horizontal");
LABEL_8:
  accessibilityLocalizedString(v4);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v6 = (void *)v5;

  return v6;
}

@end
