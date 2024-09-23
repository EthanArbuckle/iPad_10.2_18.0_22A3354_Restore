@implementation TSSIMUnlockListHeaderView

- (TSSIMUnlockListHeaderView)initWithFrame:(CGRect)a3
{
  TSSIMUnlockListHeaderView *v3;
  id v4;
  double y;
  double width;
  double height;
  UILabel *v8;
  UILabel *titleLabel;
  UILabel *v10;
  id v11;
  void *v12;
  UILabel *v13;
  UILabel *descriptionLabel;
  UILabel *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TSSIMUnlockListHeaderView;
  v3 = -[TSSIMUnlockListHeaderView initWithFrame:](&v18, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v8 = (UILabel *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v8;

    v10 = v3->_titleLabel;
    v11 = sub_10000150C();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[UILabel setFont:](v10, "setFont:", v12);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 2);
    -[TSSIMUnlockListHeaderView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v13 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = v13;

    v15 = v3->_descriptionLabel;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v15, "setFont:", v16);

    -[UILabel setTextAlignment:](v3->_descriptionLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->_descriptionLabel, "setNumberOfLines:", 0);
    -[TSSIMUnlockListHeaderView addSubview:](v3, "addSubview:", v3->_descriptionLabel);
    -[TSSIMUnlockListHeaderView _configureLabels](v3, "_configureLabels");
  }
  return v3;
}

- (void)layoutSubviews
{
  double Width;
  double x;
  double y;
  double v6;
  double height;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat MaxY;
  double v28;
  double v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;

  v30.receiver = self;
  v30.super_class = (Class)TSSIMUnlockListHeaderView;
  -[TSSIMUnlockListHeaderView layoutSubviews](&v30, "layoutSubviews");
  -[TSSIMUnlockListHeaderView bounds](self, "bounds");
  Width = CGRectGetWidth(v31);
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  v6 = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_titleLabel, "text"));
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    -[TSSIMUnlockListHeaderView _titleLabelHeightForWidth:](self, "_titleLabelHeightForWidth:", Width);
    v11 = v10;
    v32.origin.x = 0.0;
    v32.origin.y = 0.0;
    v32.size.width = Width;
    v32.size.height = v11;
    MaxY = CGRectGetMaxY(v32);
    v12 = sub_10000157C();
    v14 = v13 + 0.0;
    v15 = v12 + 0.0;
    v29 = Width - (v13 + v16);
    v18 = v11 - (v12 + v17);
  }
  else
  {
    MaxY = 0.0;
    v29 = v6;
    v18 = height;
    v15 = y;
    v14 = CGRectZero.origin.x;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_descriptionLabel, "text", *(_QWORD *)&MaxY));
  v20 = objc_msgSend(v19, "length");

  if (v20)
  {
    -[TSSIMUnlockListHeaderView _descriptionLabelHeightForWidth:](self, "_descriptionLabelHeightForWidth:", Width);
    v22 = v21;
    v23 = sub_100001590();
    x = v24 + 0.0;
    y = v28 + v23;
    v6 = Width - (v24 + v25);
    height = v22 - (v23 + v26);
  }
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v14, v15, v29, v18);
  -[UILabel setFrame:](self->_descriptionLabel, "setFrame:", x, y, v6, height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  -[TSSIMUnlockListHeaderView _titleLabelHeightForWidth:](self, "_titleLabelHeightForWidth:", a3.width, a3.height);
  v6 = v5;
  -[TSSIMUnlockListHeaderView _descriptionLabelHeightForWidth:](self, "_descriptionLabelHeightForWidth:", width);
  v8 = v6 + v7;
  v9 = width;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)setNumberOfSIMsToUnlockAndanESIMExists:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSDictionary isEqualToDictionary:](self->_numberOfSIMsToUnlockAndanESIMExists, "isEqualToDictionary:"))
  {
    objc_storeStrong((id *)&self->_numberOfSIMsToUnlockAndanESIMExists, a3);
    -[TSSIMUnlockListHeaderView _configureLabels](self, "_configureLabels");
  }

}

- (void)_configureLabels
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_numberOfSIMsToUnlockAndanESIMExists, "objectForKeyedSubscript:", CFSTR("NumOfSimsAvailKey")));
  v4 = objc_msgSend(v3, "intValue");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_numberOfSIMsToUnlockAndanESIMExists, "objectForKeyedSubscript:", CFSTR("kPhysicalSimExists")));
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = v7;
  if (v4 == 1)
  {
    if (v6)
    {
      v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SINGLE_SIM_LOCKED"), &stru_10001CAA0, CFSTR("Localizable")));

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = v9;
      v11 = CFSTR("SINGLE_SIM_LOCKED_DESCRIPTION");
    }
    else
    {
      v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SINGLE_ESIM_LOCKED"), &stru_10001CAA0, CFSTR("Localizable")));

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = v9;
      v11 = CFSTR("SINGLE_ESIM_LOCKED_DESCRIPTION");
    }
  }
  else if (v6)
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MULTIPLE_SIMS_LOCKED"), &stru_10001CAA0, CFSTR("Localizable")));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = v9;
    v11 = CFSTR("SIM_LOCKED_DESCRIPTION");
  }
  else
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MULTIPLE_ESIMS_LOCKED"), &stru_10001CAA0, CFSTR("Localizable")));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = v9;
    v11 = CFSTR("ESIM_LOCKED_DESCRIPTION");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_10001CAA0, CFSTR("Localizable")));

  if (+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SIM_LOCKED_DESCRIPTION_IN_BUDDY"), &stru_10001CAA0, CFSTR("Localizable")));
    v15 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v12, v14));

    v12 = (void *)v15;
  }
  -[UILabel setText:](self->_titleLabel, "setText:", v16);
  -[UILabel setText:](self->_descriptionLabel, "setText:", v12);
  -[TSSIMUnlockListHeaderView setNeedsLayout](self, "setNeedsLayout");
  -[TSSIMUnlockListHeaderView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (double)_titleLabelHeightForWidth:(double)a3
{
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_titleLabel, "text"));
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    return 0.0;
  v7 = sub_10000157C();
  v9 = v8;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3 - v10 - v11, 1.79769313e308);
  return v9 + v7 + v12;
}

- (double)_descriptionLabelHeightForWidth:(double)a3
{
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_descriptionLabel, "text"));
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    return 0.0;
  v7 = sub_100001590();
  v9 = v8;
  -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", a3 - v10 - v11, 1.79769313e308);
  return v9 + v7 + v12;
}

- (NSDictionary)numberOfSIMsToUnlockAndanESIMExists
{
  return self->_numberOfSIMsToUnlockAndanESIMExists;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfSIMsToUnlockAndanESIMExists, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
