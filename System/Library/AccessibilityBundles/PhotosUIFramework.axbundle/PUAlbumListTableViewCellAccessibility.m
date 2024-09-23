@implementation PUAlbumListTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUAlbumListTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("PUAlbumListCellContentView"));
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[PUAlbumListTableViewCellAccessibility contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityDescendantOfType:", NSClassFromString(CFSTR("PUAlbumListCellContentView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;

  -[PUAlbumListTableViewCellAccessibility contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityDescendantOfType:", NSClassFromString(CFSTR("PUAlbumListCellContentView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
