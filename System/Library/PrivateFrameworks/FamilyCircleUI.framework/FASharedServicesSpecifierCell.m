@implementation FASharedServicesSpecifierCell

+ (int64_t)cellStyle
{
  return 3;
}

- (id)blankIcon
{
  if (blankIcon_onceToken != -1)
    dispatch_once(&blankIcon_onceToken, &__block_literal_global_3);
  return (id)blankIcon__blankIcon;
}

void __42__FASharedServicesSpecifierCell_blankIcon__block_invoke()
{
  uint64_t v0;
  void *v1;
  CGSize v2;

  v2.width = 40.0;
  v2.height = 40.0;
  UIGraphicsBeginImageContextWithOptions(v2, 0, 0.0);
  UIGraphicsGetImageFromCurrentImageContext();
  v0 = objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  v1 = (void *)blankIcon__blankIcon;
  blankIcon__blankIcon = v0;

}

- (id)getLazyIcon
{
  void *v2;
  _FASharedServiceImage *v3;
  id v4;
  uint64_t v5;
  double v6;
  _FASharedServiceImage *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FASharedServicesSpecifierCell;
  -[PSTableCell getLazyIcon](&v9, sel_getLazyIcon);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [_FASharedServiceImage alloc];
  v4 = objc_retainAutorelease(v2);
  v5 = objc_msgSend(v4, "CGImage");
  objc_msgSend(v4, "scale");
  v7 = -[_FASharedServiceImage initWithCGImage:scale:orientation:](v3, "initWithCGImage:scale:orientation:", v5, objc_msgSend(v4, "imageOrientation"), v6);

  return v7;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FASharedServicesSpecifierCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v8, sel_refreshCellContentsWithSpecifier_, v4);
  -[FASharedServicesSpecifierCell imageView](self, "imageView", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentMode:", 1);

  -[FASharedServicesSpecifierCell detailTextLabel](self, "detailTextLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D28]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setText:", v7);
  -[FASharedServicesSpecifierCell setNeedsLayout](self, "setNeedsLayout");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);
}

@end
