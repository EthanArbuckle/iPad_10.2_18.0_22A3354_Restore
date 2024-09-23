@implementation FBKDeviceDisplayCell

- (double)spaceFromSuperViewToLabel
{
  void *v2;
  double v3;
  double v4;

  -[FBKDeviceDisplayCell nameLabel](self, "nameLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;

  return v4;
}

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FBKDeviceDisplayCell;
  -[FBKDeviceDisplayCell awakeFromNib](&v9, sel_awakeFromNib);
  -[FBKDeviceDisplayCell nameLabel](self, "nameLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", &stru_24E15EAF8);

  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDeviceDisplayCell nameLabel](self, "nameLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

  -[FBKDeviceDisplayCell typeLabel](self, "typeLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", &stru_24E15EAF8);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDeviceDisplayCell typeLabel](self, "typeLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  -[FBKDeviceDisplayCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  -[FBKDeviceDisplayCell setHorizontalFrameInset:](self, "setHorizontalFrameInset:", 0.0);
}

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)setFrame:(CGRect)a3
{
  double horizontalFrameInset;
  double v4;
  BOOL v5;
  double v6;
  objc_super v7;

  horizontalFrameInset = self->_horizontalFrameInset;
  v4 = a3.size.width + horizontalFrameInset * -2.0;
  v5 = horizontalFrameInset == 0.0;
  if (horizontalFrameInset == 0.0)
    horizontalFrameInset = -0.0;
  v6 = a3.origin.x + horizontalFrameInset;
  if (!v5)
    a3.size.width = v4;
  v7.receiver = self;
  v7.super_class = (Class)FBKDeviceDisplayCell;
  -[FBKDeviceDisplayCell setFrame:](&v7, sel_setFrame_, v6, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)didTapConnectionButton:(id)a3
{
  NSLog(CFSTR("tapped no connection icon"), a2, a3);
}

- (void)updateWithDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  _QWORD v11[5];

  v4 = a3;
  objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDeviceDisplayCell nameLabel](self, "nameLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(v4, "displayType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDeviceDisplayCell typeLabel](self, "typeLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  *(float *)&v10 = v10;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __41__FBKDeviceDisplayCell_updateWithDevice___block_invoke;
  v11[3] = &unk_24E157E88;
  v11[4] = self;
  objc_msgSend(v4, "fetchIconImageDataForScale:completionCompletion:", v11, v10);

  -[FBKDeviceDisplayCell updateNumberOfLines](self, "updateNumberOfLines");
}

uint64_t __41__FBKDeviceDisplayCell_updateWithDevice___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  if (a2)
  {
    v2 = result;
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v2 + 32), "deviceIcon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", v3);

    return objc_msgSend(*(id *)(v2 + 32), "setNeedsDisplay");
  }
  return result;
}

- (void)configureSelected:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 3;
  else
    v3 = 0;
  -[FBKDeviceDisplayCell setAccessoryType:](self, "setAccessoryType:", v3);
}

- (void)updateNumberOfLines
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  void *v6;
  id v7;

  -[FBKDeviceDisplayCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  -[FBKDeviceDisplayCell nameLabel](self, "nameLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", !IsAccessibilityCategory);

  -[FBKDeviceDisplayCell typeLabel](self, "typeLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfLines:", !IsAccessibilityCategory);

}

- (void)layoutSubviews
{
  objc_super v3;

  -[FBKDeviceDisplayCell updateNumberOfLines](self, "updateNumberOfLines");
  v3.receiver = self;
  v3.super_class = (Class)FBKDeviceDisplayCell;
  -[FBKDeviceDisplayCell layoutSubviews](&v3, sel_layoutSubviews);
}

- (NSString)itemIdentifier
{
  return self->itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->itemIdentifier, a3);
}

- (double)horizontalFrameInset
{
  return self->_horizontalFrameInset;
}

- (void)setHorizontalFrameInset:(double)a3
{
  self->_horizontalFrameInset = a3;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)typeLabel
{
  return self->_typeLabel;
}

- (void)setTypeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_typeLabel, a3);
}

- (UIImageView)deviceIcon
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_deviceIcon);
}

- (void)setDeviceIcon:(id)a3
{
  objc_storeWeak((id *)&self->_deviceIcon, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceIcon);
  objc_storeStrong((id *)&self->_typeLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->itemIdentifier, 0);
}

@end
