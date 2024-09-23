@implementation UIKeyboardStickerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboardStickerCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardStickerCollectionViewCell"), CFSTR("imageGlyph"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityIdentifier
{
  id v2;
  id v4;
  char v5;
  id v6;
  objc_super v7;
  SEL v8;
  UIKeyboardStickerCollectionViewCellAccessibility *v9;
  id v10;

  v9 = self;
  v8 = a2;
  v4 = (id)-[UIKeyboardStickerCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("imageGlyph.toString"));
  v5 = 0;
  if (v4)
  {
    v2 = v4;
  }
  else
  {
    v7.receiver = v9;
    v7.super_class = (Class)UIKeyboardStickerCollectionViewCellAccessibility;
    v6 = -[UIKeyboardStickerCollectionViewCellAccessibility accessibilityIdentifier](&v7, sel_accessibilityIdentifier);
    v5 = 1;
    v2 = v6;
  }
  v10 = v2;
  if ((v5 & 1) != 0)

  return v10;
}

- (id)accessibilityLabel
{
  objc_super v3;
  int v4;
  id location;
  id v6[2];
  UIKeyboardStickerCollectionViewCellAccessibility *v7;
  id v8;

  v7 = self;
  v6[1] = (id)a2;
  v6[0] = (id)-[UIKeyboardStickerCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageGlyph.accessibilityCaption"));
  location = (id)-[UIKeyboardStickerCollectionViewCellAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("imageGlyph.searchText"));
  if (v6[0])
  {
    v8 = v6[0];
    v4 = 1;
  }
  else
  {
    if (location)
    {
      v8 = location;
    }
    else
    {
      v3.receiver = v7;
      v3.super_class = (Class)UIKeyboardStickerCollectionViewCellAccessibility;
      v8 = -[UIKeyboardStickerCollectionViewCellAccessibility accessibilityLabel](&v3, sel_accessibilityLabel);
    }
    v4 = 1;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v6, 0);
  return v8;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73F0] | *MEMORY[0x24BDF73D0];
}

@end
