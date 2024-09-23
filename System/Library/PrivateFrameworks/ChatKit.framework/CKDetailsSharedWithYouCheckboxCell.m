@implementation CKDetailsSharedWithYouCheckboxCell

- (CKDetailsSharedWithYouCheckboxCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKDetailsSharedWithYouCheckboxCell *v4;
  CKDetailsSharedWithYouCheckboxCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKDetailsSharedWithYouCheckboxCell;
  v4 = -[CKTranscriptDetailsResizableCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CKDetailsSharedWithYouCheckboxCell _configureNewControlSwitch](v4, "_configureNewControlSwitch");
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "theme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "detailsCellStaticTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsSharedWithYouCheckboxCell controlSwitch](v5, "controlSwitch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOnTintColor:", v8);

    -[CKDetailsSharedWithYouCheckboxCell _configureNewTitleLabel](v5, "_configureNewTitleLabel");
    -[CKDetailsCell topSeperator](v5, "topSeperator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

    -[CKDetailsCell bottomSeperator](v5, "bottomSeperator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 1);

  }
  return v5;
}

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailsSharedWithYouCheckboxCell_reuseIdentifier");
}

+ (BOOL)shouldHighlight
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (CKIsRunningInMacCatalyst())
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "detailsContactCellMinimumHeight");
    v8 = v7 + 16.0;

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CKDetailsSharedWithYouCheckboxCell;
    -[CKDetailsSharedWithYouCheckboxCell sizeThatFits:](&v13, sel_sizeThatFits_, width, height);
    width = v9;
    v8 = v10;
  }
  v11 = width;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (UISwitch)controlSwitch
{
  UISwitch *controlSwitch;

  controlSwitch = self->_controlSwitch;
  if (!controlSwitch)
  {
    -[CKDetailsSharedWithYouCheckboxCell _configureNewControlSwitch](self, "_configureNewControlSwitch");
    controlSwitch = self->_controlSwitch;
  }
  return controlSwitch;
}

- (void)_configureNewControlSwitch
{
  UISwitch *controlSwitch;
  id v4;
  UISwitch *v5;
  UISwitch *v6;
  id v7;

  controlSwitch = self->_controlSwitch;
  if (controlSwitch)
  {
    -[UISwitch removeFromSuperview](controlSwitch, "removeFromSuperview");
    -[UISwitch removeTarget:action:forControlEvents:](self->_controlSwitch, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);
  }
  v4 = objc_alloc(MEMORY[0x1E0CEAA38]);
  v5 = (UISwitch *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = self->_controlSwitch;
  self->_controlSwitch = v5;

  -[UISwitch setPreferredStyle:](self->_controlSwitch, "setPreferredStyle:", 1);
  -[CKDetailsSharedWithYouCheckboxCell contentView](self, "contentView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_controlSwitch);

}

- (void)_configureNewTitleLabel
{
  UILabel *titleLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  void *v16;
  id v17;

  titleLabel = self->_titleLabel;
  if (titleLabel)
    -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
  v4 = objc_alloc(MEMORY[0x1E0CEA700]);
  v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = self->_titleLabel;
  self->_titleLabel = v5;

  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SHARED_WITH_YOU_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedUppercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v9);

  v10 = self->_titleLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v10, "setBackgroundColor:", v11);

  v12 = self->_titleLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v12, "setTextColor:", v13);

  v14 = self->_titleLabel;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "headerFont");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v14, "setFont:", v16);

  -[CKDetailsSharedWithYouCheckboxCell contentView](self, "contentView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", self->_titleLabel);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double MaxX;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;
  CGRect v32;

  v31.receiver = self;
  v31.super_class = (Class)CKDetailsSharedWithYouCheckboxCell;
  -[CKDetailsCell layoutSubviews](&v31, sel_layoutSubviews);
  -[CKDetailsSharedWithYouCheckboxCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CKDetailsSharedWithYouCheckboxCell layoutMargins](self, "layoutMargins");
  v13 = v5 + v12;
  v15 = v7 + v14;
  v17 = v9 - (v12 + v16);
  v19 = v11 - (v14 + v18);

  v20 = v13 + -2.0;
  -[CKDetailsSharedWithYouCheckboxCell controlSwitch](self, "controlSwitch");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v20, v15 + 8.0, v17, v19);
  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection"))
  {
    v32.origin.x = v20;
    v32.origin.y = v15;
    v32.size.width = v17;
    v32.size.height = v19;
    MaxX = CGRectGetMaxX(v32);
    -[UILabel bounds](self->_titleLabel, "bounds");
    v20 = MaxX - v23 + 2.0;
  }
  -[CKDetailsSharedWithYouCheckboxCell layoutMargins](self, "layoutMargins");
  v25 = v24;
  -[UILabel bounds](self->_titleLabel, "bounds");
  v27 = v26;
  -[UILabel bounds](self->_titleLabel, "bounds");
  v29 = v28;
  -[CKDetailsSharedWithYouCheckboxCell layoutMargins](self, "layoutMargins");
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v20, v25, v27, v29 + v30 * 2.0);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKDetailsSharedWithYouCheckboxCell;
  -[CKDetailsCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CKDetailsSharedWithYouCheckboxCell _configureNewControlSwitch](self, "_configureNewControlSwitch");
  -[CKDetailsSharedWithYouCheckboxCell _configureNewTitleLabel](self, "_configureNewTitleLabel");
}

- (void)setControlSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_controlSwitch, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_controlSwitch, 0);
}

@end
