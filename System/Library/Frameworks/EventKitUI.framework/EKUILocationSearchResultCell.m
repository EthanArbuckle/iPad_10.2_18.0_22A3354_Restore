@implementation EKUILocationSearchResultCell

- (EKUILocationSearchResultCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKUILocationSearchResultCell *v4;
  EKUILocationSearchResultCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKUILocationSearchResultCell;
  v4 = -[EKUILocationSearchResultCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, 3, a4);
  v5 = v4;
  if (v4)
    -[EKUILocationSearchResultCell updateSeparatorInset](v4, "updateSeparatorInset");
  return v5;
}

- (void)updateSeparatorInset
{
  CalInterfaceIsLeftToRight();
  -[EKUILocationSearchResultCell safeAreaInsets](self, "safeAreaInsets");
  -[EKUILocationSearchResultCell separatorInset](self, "separatorInset");
  -[EKUILocationSearchResultCell setSeparatorInset:](self, "setSeparatorInset:");
}

- (id)defaultContentConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)EKUILocationSearchResultCell;
  -[EKUILocationSearchResultCell defaultContentConfiguration](&v12, sel_defaultContentConfiguration);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfLines:", 1);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondaryTextProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v4);

  objc_msgSend(v2, "secondaryTextProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 1);

  objc_msgSend(v2, "setImageToTextPadding:", 10.0);
  objc_msgSend(v2, "setAxesPreservingSuperviewLayoutMargins:", 1);
  objc_msgSend(v2, "setDirectionalLayoutMargins:", 11.0, 0.0, 11.0, 0.0);
  objc_msgSend(MEMORY[0x1E0CAA038], "conferenceImageSize");
  v8 = v7;
  objc_msgSend(v2, "imageProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setReservedLayoutSize:", v8, v8);

  objc_msgSend(v2, "imageProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMaximumSize:", v8, v8);

  return v2;
}

@end
