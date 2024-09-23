@implementation DSWelcomeTableViewCell

- (DSWelcomeTableViewCell)init
{
  DSWelcomeTableViewCell *v2;
  DSWelcomeTableViewCell *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DSWelcomeTableViewCell;
  v2 = -[DSWelcomeTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, 3, CFSTR("DSWelcomeCell"));
  v3 = v2;
  if (v2)
  {
    -[DSWelcomeTableViewCell customizeProperties](v2, "customizeProperties");
    -[DSWelcomeTableViewCell constrainImageViews](v3, "constrainImageViews");
    -[DSWelcomeTableViewCell constrainTextLabels](v3, "constrainTextLabels");
    v4 = (void *)MEMORY[0x24BDD1628];
    -[DSWelcomeTableViewCell constraints](v3, "constraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activateConstraints:", v5);

  }
  return v3;
}

- (void)customizeProperties
{
  NSMutableArray *v3;
  NSMutableArray *constraints;
  void *v5;
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
  id v17;

  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  constraints = self->_constraints;
  self->_constraints = v3;

  -[DSWelcomeTableViewCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfLines:", 0);

  -[DSWelcomeTableViewCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLineBreakMode:", 0);

  -[DSWelcomeTableViewCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v8);

  -[DSWelcomeTableViewCell detailTextLabel](self, "detailTextLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v10);

  -[DSWelcomeTableViewCell detailTextLabel](self, "detailTextLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v12);

  -[DSWelcomeTableViewCell detailTextLabel](self, "detailTextLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNumberOfLines:", 0);

  -[DSWelcomeTableViewCell detailTextLabel](self, "detailTextLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLineBreakMode:", 0);

  -[DSWelcomeTableViewCell detailTextLabel](self, "detailTextLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeToFit");

  -[DSWelcomeTableViewCell setAccessoryType:](self, "setAccessoryType:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemFillColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSWelcomeTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v16);

  -[DSWelcomeTableViewCell imageView](self, "imageView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContentMode:", 1);

}

- (void)constrainImageViews
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  -[DSWelcomeTableViewCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[DSWelcomeTableViewCell constraints](self, "constraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSWelcomeTableViewCell imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widthAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToConstant:", 40.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

  -[DSWelcomeTableViewCell constraints](self, "constraints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSWelcomeTableViewCell imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToConstant:", 40.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v11);

  -[DSWelcomeTableViewCell constraints](self, "constraints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSWelcomeTableViewCell imageView](self, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSWelcomeTableViewCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "centerYAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v17);

  -[DSWelcomeTableViewCell constraints](self, "constraints");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[DSWelcomeTableViewCell imageView](self, "imageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSWelcomeTableViewCell layoutMarginsGuide](self, "layoutMarginsGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v22);

}

- (void)constrainTextLabels
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v17;
  void *v18;
  void *v19;
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
  void *v40;
  id v41;

  -[DSWelcomeTableViewCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[DSWelcomeTableViewCell constraints](self, "constraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSWelcomeTableViewCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSWelcomeTableViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutMarginsGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v10);

  -[DSWelcomeTableViewCell constraints](self, "constraints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSWelcomeTableViewCell textLabel](self, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSWelcomeTableViewCell imageView](self, "imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, 10.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v16);

  -[DSWelcomeTableViewCell constraints](self, "constraints");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSWelcomeTableViewCell textLabel](self, "textLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSWelcomeTableViewCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "widthAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:multiplier:", v21, 0.8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v22);

  -[DSWelcomeTableViewCell detailTextLabel](self, "detailTextLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[DSWelcomeTableViewCell constraints](self, "constraints");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSWelcomeTableViewCell detailTextLabel](self, "detailTextLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSWelcomeTableViewCell textLabel](self, "textLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObject:", v29);

  -[DSWelcomeTableViewCell constraints](self, "constraints");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSWelcomeTableViewCell detailTextLabel](self, "detailTextLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSWelcomeTableViewCell textLabel](self, "textLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v35);

  -[DSWelcomeTableViewCell constraints](self, "constraints");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  -[DSWelcomeTableViewCell detailTextLabel](self, "detailTextLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "widthAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSWelcomeTableViewCell contentView](self, "contentView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "widthAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:multiplier:", v39, 0.8);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addObject:", v40);

}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end
