@implementation WDDataProviderTableViewCell

- (WDDataProviderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDDataProviderTableViewCell *v4;
  WDDataProviderTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDDataProviderTableViewCell;
  v4 = -[WDDataProviderTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[WDDataProviderTableViewCell _setupUI](v4, "_setupUI");
  return v5;
}

- (void)_setupUI
{
  UILabel *v3;
  UILabel *inactiveLabel;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIButton *v10;
  UIButton *checkmarkButton;
  UIButton *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  CGSize v41;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
  inactiveLabel = self->_inactiveLabel;
  self->_inactiveLabel = v3;

  -[WDDataProviderTableViewCell detailTextLabel](self, "detailTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_inactiveLabel, "setFont:", v6);

  -[UILabel setHidden:](self->_inactiveLabel, "setHidden:", 1);
  WDBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("INACTIVE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_inactiveLabel, "setText:", v8);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_inactiveLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_inactiveLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("checkmark"));
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "size");
  UIGraphicsBeginImageContext(v41);
  UIGraphicsGetImageFromCurrentImageContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  v10 = (UIButton *)objc_alloc_init(MEMORY[0x24BDF6880]);
  checkmarkButton = self->_checkmarkButton;
  self->_checkmarkButton = v10;

  -[UIButton setImage:forState:](self->_checkmarkButton, "setImage:forState:", v9, 0);
  -[UIButton setImage:forState:](self->_checkmarkButton, "setImage:forState:", v40, 4);
  v12 = self->_checkmarkButton;
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](v12, "setTitleColor:forState:", v13, 0);

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_checkmarkButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setUserInteractionEnabled:](self->_checkmarkButton, "setUserInteractionEnabled:", 0);
  -[WDDataProviderTableViewCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", self->_inactiveLabel);

  -[WDDataProviderTableViewCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", self->_checkmarkButton);

  -[UIButton widthAnchor](self->_checkmarkButton, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton intrinsicContentSize](self->_checkmarkButton, "intrinsicContentSize");
  objc_msgSend(v16, "constraintEqualToConstant:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[UIButton leadingAnchor](self->_checkmarkButton, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataProviderTableViewCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton intrinsicContentSize](self->_checkmarkButton, "intrinsicContentSize");
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20, -v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataProviderTableViewCell setCheckmarkLeadingConstraint:](self, "setCheckmarkLeadingConstraint:", v22);

  -[WDDataProviderTableViewCell checkmarkLeadingConstraint](self, "checkmarkLeadingConstraint");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[UIButton setAlpha:](self->_checkmarkButton, "setAlpha:", 0.0);
  -[UIButton centerYAnchor](self->_checkmarkButton, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataProviderTableViewCell imageView](self, "imageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "centerYAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

  -[UILabel topAnchor](self->_inactiveLabel, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataProviderTableViewCell textLabel](self, "textLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  -[UILabel leadingAnchor](self->_inactiveLabel, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataProviderTableViewCell textLabel](self, "textLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

  -[UILabel trailingAnchor](self->_inactiveLabel, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDataProviderTableViewCell contentView](self, "contentView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v38, 10.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setActive:", 1);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  v11.receiver = self;
  v11.super_class = (Class)WDDataProviderTableViewCell;
  -[WDDataProviderTableViewCell sizeThatFits:](&v11, sel_sizeThatFits_, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  if (!-[WDDataProviderTableViewCell isActive](self, "isActive"))
  {
    -[UILabel sizeThatFits:](self->_inactiveLabel, "sizeThatFits:", v5, 0.0);
    v7 = v7 + v8;
  }
  v9 = v5;
  v10 = v7;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
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
  double v21;
  double v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  UIButton *checkmarkButton;
  double v30;
  void *v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  objc_super v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v57.receiver = self;
  v57.super_class = (Class)WDDataProviderTableViewCell;
  -[WDDataProviderTableViewCell layoutSubviews](&v57, sel_layoutSubviews);
  -[WDDataProviderTableViewCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v51 = v6;
  v55 = v8;
  v56 = v7;

  -[WDDataProviderTableViewCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v53 = v15;
  v54 = v14;

  -[UILabel frame](self->_inactiveLabel, "frame");
  v17 = v16;
  v50 = v18;
  v20 = v19;
  v22 = v21;
  v23 = -[WDDataProviderTableViewCell isActive](self, "isActive");
  if (v23)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDataProviderTableViewCell textLabel](self, "textLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTextColor:", v24);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDDataProviderTableViewCell textLabel](self, "textLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTextColor:", v26);

    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_inactiveLabel, "setTextColor:", v24);
  }

  -[UILabel setHidden:](self->_inactiveLabel, "setHidden:", v23);
  -[UIButton setSelected:](self->_checkmarkButton, "setSelected:", v23);
  v28 = -[WDDataProviderTableViewCell isEditing](self, "isEditing");
  checkmarkButton = self->_checkmarkButton;
  v30 = v22;
  if (v28)
  {
    -[UIButton setAlpha:](checkmarkButton, "setAlpha:", 1.0);
    -[WDDataProviderTableViewCell checkmarkLeadingConstraint](self, "checkmarkLeadingConstraint");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setConstant:", 10.0);

    v32 = -[WDDataProviderTableViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    -[WDDataProviderTableViewCell checkmarkLeadingConstraint](self, "checkmarkLeadingConstraint");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constant");
    v35 = v34;
    -[UIButton intrinsicContentSize](self->_checkmarkButton, "intrinsicContentSize");
    v37 = v35 + v36;
    v38 = v20;
    if (v32)
    {
      v39 = v37 + -4.0;

      v40 = 0.0;
      if (v39 >= 0.0)
        v40 = v39;
      v5 = v5 - v40;
      v11 = v11 - v40;
    }
    else
    {
      v44 = v37 + 4.0 - v5;

      v45 = 0.0;
      if (v44 >= 0.0)
        v45 = v44;
      v5 = v5 + v45;
      v11 = v11 + v45;
    }
  }
  else
  {
    v38 = v20;
    -[UIButton intrinsicContentSize](checkmarkButton, "intrinsicContentSize");
    v42 = -v41;
    -[WDDataProviderTableViewCell checkmarkLeadingConstraint](self, "checkmarkLeadingConstraint");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setConstant:", v42);

    -[UIButton setAlpha:](self->_checkmarkButton, "setAlpha:", 0.0);
  }
  v52 = v5;
  if (-[WDDataProviderTableViewCell isActive](self, "isActive"))
  {
    v46 = v51;
    v47 = v13;
  }
  else
  {
    v58.origin.x = v17;
    v58.origin.y = v50;
    v58.size.width = v38;
    v58.size.height = v30;
    v46 = v51 - CGRectGetHeight(v58) * 0.25;
    v59.origin.x = v17;
    v59.origin.y = v50;
    v59.size.width = v38;
    v59.size.height = v30;
    v47 = v13 - CGRectGetHeight(v59) * 0.25;
  }
  v60.origin.x = v11;
  v60.origin.y = v47;
  v60.size.width = v54;
  v60.size.height = v53;
  -[UILabel setFrame:](self->_inactiveLabel, "setFrame:", v17, CGRectGetMaxY(v60), v38, v30);
  -[WDDataProviderTableViewCell imageView](self, "imageView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setFrame:", v52, v46, v56, v55);

  -[WDDataProviderTableViewCell textLabel](self, "textLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setFrame:", v11, v47, v54, v53);

}

- (void)prepareForReuse
{
  double v3;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDDataProviderTableViewCell;
  -[WDDataProviderTableViewCell prepareForReuse](&v6, sel_prepareForReuse);
  -[UIButton intrinsicContentSize](self->_checkmarkButton, "intrinsicContentSize");
  v4 = -v3;
  -[WDDataProviderTableViewCell checkmarkLeadingConstraint](self, "checkmarkLeadingConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v4);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  v4 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__WDDataProviderTableViewCell_setEditing_animated___block_invoke;
  v7[3] = &unk_24D38E300;
  v8 = a3;
  v7[4] = self;
  v5 = MEMORY[0x2199E6E80](v7, a2);
  v6 = (void *)v5;
  if (v4)
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v5, 0.25);
  else
    (*(void (**)(uint64_t))(v5 + 16))(v5);

}

id __51__WDDataProviderTableViewCell_setEditing_animated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)WDDataProviderTableViewCell;
  return objc_msgSendSuper2(&v3, sel_setEditing_animated_, v1, 0);
}

- (CGSize)iconSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[WDDataProviderTableViewCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WDDataProviderTableViewCell imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    v8 = v7;
    v10 = v9;

  }
  else
  {
    v8 = *MEMORY[0x24BDBF148];
    v10 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setDisplayName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WDDataProviderTableViewCell textLabel](self, "textLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)setIconImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WDDataProviderTableViewCell imageView](self, "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (NSLayoutConstraint)checkmarkLeadingConstraint
{
  return self->_checkmarkLeadingConstraint;
}

- (void)setCheckmarkLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkLeadingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_iconImageWidth, 0);
  objc_storeStrong((id *)&self->_checkmarkButton, 0);
  objc_storeStrong((id *)&self->_inactiveLabel, 0);
}

@end
