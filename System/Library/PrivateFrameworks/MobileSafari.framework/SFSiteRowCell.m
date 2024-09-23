@implementation SFSiteRowCell

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("SiteRow");
}

+ (double)leadingSpace
{
  return 12.0;
}

- (SFSiteRowCell)initWithFrame:(CGRect)a3
{
  SFSiteRowCell *v3;
  SFSiteRowCell *v4;
  void *v5;
  UILabel *v6;
  UILabel *label;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  SFSiteRowCell *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  _QWORD v31[6];

  v31[5] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)SFSiteRowCell;
  v3 = -[SFStartPageFilledBackgroundCell initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFSiteRowCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageFilledBackgroundCell defaultBackgroundConfiguration](v4, "defaultBackgroundConfiguration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setCornerRadius:", 10.0);
    -[SFSiteRowCell setBackgroundConfiguration:](v4, "setBackgroundConfiguration:", v29);
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v4->_label;
    v4->_label = v6;

    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_label, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "_sf_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4B10], 0x8000);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_label, "setFont:", v8);

    -[UILabel setNumberOfLines:](v4->_label, "setNumberOfLines:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addSubview:", v4->_label);
    v22 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel centerXAnchor](v4->_label, "centerXAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v26;
    -[UILabel leadingAnchor](v4->_label, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFSiteRowCell leadingSpace](SFSiteRowCell, "leadingSpace");
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v23;
    -[UILabel centerYAnchor](v4->_label, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v9;
    -[UILabel topAnchor](v4->_label, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintGreaterThanOrEqualToAnchor:constant:", v11, 10.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v12;
    objc_msgSend(v5, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToConstant:", 40.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = 1132068864;
    objc_msgSend(v14, "sf_withPriority:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[4] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v17);

    v18 = v4;
  }

  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  v5 = -[SFSiteRowCell isHighlighted](self, "isHighlighted");
  v10.receiver = self;
  v10.super_class = (Class)SFSiteRowCell;
  -[SFSiteRowCell setHighlighted:](&v10, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    if (v3)
      v6 = CFSTR("SiteRowBackground.Highlighted");
    else
      v6 = CFSTR("SiteRowBackground.Normal");
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_colorNamed:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageFilledBackgroundCell backgroundEffectView](self, "backgroundEffectView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSiteRowCell configurationState](self, "configurationState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sf_setHighlighted:cellState:nonVibrantBackgroundColor:", v3, v9, v7);

  }
}

- (NSString)title
{
  return -[UILabel text](self->_label, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
