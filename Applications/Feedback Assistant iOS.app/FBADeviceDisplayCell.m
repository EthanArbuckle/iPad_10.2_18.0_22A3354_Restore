@implementation FBADeviceDisplayCell

- (double)spaceFromSuperViewToLabel
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceDisplayCell nameLabel](self, "nameLabel"));
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
  v9.super_class = (Class)FBADeviceDisplayCell;
  -[FBADeviceDisplayCell awakeFromNib](&v9, "awakeFromNib");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceDisplayCell nameLabel](self, "nameLabel"));
  objc_msgSend(v3, "setText:", &stru_1000EA660);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceDisplayCell nameLabel](self, "nameLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceDisplayCell typeLabel](self, "typeLabel"));
  objc_msgSend(v6, "setText:", &stru_1000EA660);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceDisplayCell typeLabel](self, "typeLabel"));
  objc_msgSend(v8, "setTextColor:", v7);

  -[FBADeviceDisplayCell setSelectionStyle:](self, "setSelectionStyle:", 0);
}

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1);
  return NSStringFromClass(v2);
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceDisplayCell nameLabel](self, "nameLabel"));
  objc_msgSend(v6, "setText:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceDisplayCell typeLabel](self, "typeLabel"));
  objc_msgSend(v8, "setText:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v9, "scale");
  *(float *)&v10 = v10;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002A2A0;
  v11[3] = &unk_1000E7040;
  v11[4] = self;
  objc_msgSend(v4, "fetchIconImageDataForScale:completionCompletion:", v11, v10);

  -[FBADeviceDisplayCell updateNumberOfLines](self, "updateNumberOfLines");
}

- (void)configureSelected:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 3;
  else
    v3 = 0;
  -[FBADeviceDisplayCell setAccessoryType:](self, "setAccessoryType:", v3);
}

- (void)updateNumberOfLines
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceDisplayCell traitCollection](self, "traitCollection"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceDisplayCell nameLabel](self, "nameLabel"));
  objc_msgSend(v6, "setNumberOfLines:", !IsAccessibilityCategory);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[FBADeviceDisplayCell typeLabel](self, "typeLabel"));
  objc_msgSend(v7, "setNumberOfLines:", !IsAccessibilityCategory);

}

- (void)layoutSubviews
{
  objc_super v3;

  -[FBADeviceDisplayCell updateNumberOfLines](self, "updateNumberOfLines");
  v3.receiver = self;
  v3.super_class = (Class)FBADeviceDisplayCell;
  -[FBADeviceDisplayCell layoutSubviews](&v3, "layoutSubviews");
}

- (NSString)itemIdentifier
{
  return self->itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->itemIdentifier, a3);
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
