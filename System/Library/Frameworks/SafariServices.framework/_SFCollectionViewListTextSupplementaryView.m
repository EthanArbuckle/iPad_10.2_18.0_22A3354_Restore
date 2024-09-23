@implementation _SFCollectionViewListTextSupplementaryView

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("_SFCollectionViewListTextSupplementaryViewReuseIdentifier");
}

- (_SFCollectionViewListTextSupplementaryView)initWithFrame:(CGRect)a3
{
  _SFCollectionViewListTextSupplementaryView *v3;
  UILabel *v4;
  UILabel *label;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _SFCollectionViewListTextSupplementaryView *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)_SFCollectionViewListTextSupplementaryView;
  v3 = -[_SFCollectionViewListTextSupplementaryView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v3->_label;
    v3->_label = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v6);

    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_label, "setFont:", v7);

    -[UILabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 0);
    -[_SFCollectionViewListTextSupplementaryView addSubview:](v3, "addSubview:", v3->_label);
    -[_SFCollectionViewListTextSupplementaryView setLayoutMargins:](v3, "setLayoutMargins:", 8.0, 20.0, 8.0, 20.0);
    -[_SFCollectionViewListTextSupplementaryView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v3->_label, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v22;
    -[UILabel leadingAnchor](v3->_label, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v9;
    -[UILabel trailingAnchor](v3->_label, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v12;
    -[UILabel bottomAnchor](v3->_label, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateConstraints:", v16);

    v17 = v3;
  }

  return v3;
}

- (void)setText:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
}

- (NSString)text
{
  return -[UILabel text](self->_label, "text");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
