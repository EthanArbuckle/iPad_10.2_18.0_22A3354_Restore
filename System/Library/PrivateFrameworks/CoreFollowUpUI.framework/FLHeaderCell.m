@implementation FLHeaderCell

+ (int64_t)cellStyle
{
  return 3;
}

- (FLHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  FLHeaderCell *v9;
  FLHeaderCell *v10;
  void *v11;
  void *v12;
  int v13;
  UILabel *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  UILabel *followTitle;
  UILabel *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  double v30;
  UILabel *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  UILabel *followSubtitle;
  void *v38;
  objc_super v40;

  v8 = a5;
  v40.receiver = self;
  v40.super_class = (Class)FLHeaderCell;
  v9 = -[FLHeaderCell initWithStyle:reuseIdentifier:](&v40, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v10 = v9;
  if (v9)
  {
    -[FLHeaderCell setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", 0);
    objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE1B2C8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "groupIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BE1B2F8]);

    v14 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v14, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v14, "setLineBreakMode:", 0);
    if (v13)
    {
      v15 = *MEMORY[0x24BDF77B0];
      objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v14, "setFont:", v16);

      objc_msgSend(MEMORY[0x24BE75530], "appearance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "textColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        -[UILabel setTextColor:](v14, "setTextColor:", v18);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v14, "setTextColor:", v22);

      }
      LODWORD(v23) = 1144750080;
      -[UILabel setContentCompressionResistancePriority:forAxis:](v14, "setContentCompressionResistancePriority:forAxis:", 0, v23);
      followTitle = v10->_followTitle;
      v10->_followTitle = v14;

      v25 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
      objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v25, "setTextColor:", v26);

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UILabel setNumberOfLines:](v25, "setNumberOfLines:", 0);
      -[UILabel setLineBreakMode:](v25, "setLineBreakMode:", 0);
      v27 = (void *)MEMORY[0x24BDF6A70];
      v28 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v14, "setFont:", v19);

      objc_msgSend(MEMORY[0x24BE75530], "appearance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "textColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        -[UILabel setTextColor:](v14, "setTextColor:", v21);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v14, "setTextColor:", v29);

      }
      LODWORD(v30) = 1144750080;
      -[UILabel setContentCompressionResistancePriority:forAxis:](v14, "setContentCompressionResistancePriority:forAxis:", 0, v30);
      v31 = v10->_followTitle;
      v10->_followTitle = v14;

      v25 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
      objc_msgSend(MEMORY[0x24BE75530], "appearance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "textColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        -[UILabel setTextColor:](v25, "setTextColor:", v33);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v25, "setTextColor:", v34);

      }
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UILabel setNumberOfLines:](v25, "setNumberOfLines:", 0);
      -[UILabel setLineBreakMode:](v25, "setLineBreakMode:", 0);
      v27 = (void *)MEMORY[0x24BDF6A70];
      v28 = *MEMORY[0x24BDF7810];
    }
    objc_msgSend(v27, "preferredFontForTextStyle:", v28);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v25, "setFont:", v35);

    LODWORD(v36) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v25, "setContentCompressionResistancePriority:forAxis:", 0, v36);
    followSubtitle = v10->_followSubtitle;
    v10->_followSubtitle = v25;

    -[FLHeaderCell contentView](v10, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSubview:", v10->_followTitle);
    objc_msgSend(v38, "addSubview:", v10->_followSubtitle);
    -[FLHeaderCell layoutSubviews](v10, "layoutSubviews");

  }
  return v10;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FLHeaderCell;
  -[PSTableCell layoutSubviews](&v3, sel_layoutSubviews);
  -[FLHeaderCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)FLHeaderCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v22, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE1B2C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "groupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE1B2F0];
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE1B2F0]) & 1) != 0)
  {
    objc_msgSend(v5, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BE1B368];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE1B368]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](self->_followTitle, "setText:", v13);

      goto LABEL_6;
    }
  }
  else
  {

  }
  objc_msgSend(v5, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_followTitle, "setText:", v12);
LABEL_6:

  objc_msgSend(v5, "groupIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "isEqualToString:", v7))
  {

    goto LABEL_11;
  }
  v15 = objc_msgSend(v5, "displayExpirationDate");

  if (!v15)
  {
LABEL_11:
    objc_msgSend(v5, "informativeText");
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v18 = (void *)v21;
    -[UILabel setText:](self->_followSubtitle, "setText:", v21);
    goto LABEL_13;
  }
  objc_msgSend(v5, "informativeText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(v5, "formattedExpirationDate");
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "formattedExpirationDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "informativeText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@\n%@"), v18, v19, v22.receiver, v22.super_class);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_followSubtitle, "setText:", v20);

LABEL_13:
  -[FLHeaderCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_constraints);
  -[PSTableCell specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", *MEMORY[0x24BE75AC8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[FLHeaderCell _updateConstraintsWithImage](self, "_updateConstraintsWithImage");
  else
    -[FLHeaderCell _updateConstraintsWithNoImage](self, "_updateConstraintsWithNoImage");
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_constraints);
  v5.receiver = self;
  v5.super_class = (Class)FLHeaderCell;
  -[FLHeaderCell updateConstraints](&v5, sel_updateConstraints);
}

- (void)_updateConstraintsWithNoImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *constraints;
  id v9;

  _NSDictionaryOfVariableBindings(CFSTR("_followTitle, _followSubtitle"), self->_followTitle, self->_followSubtitle, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_followTitle]-|"), 0, 0, v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_followSubtitle]-|"), 0, 0, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-11-[_followTitle]-[_followSubtitle]-11-|"), 0, 0, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v5);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  constraints = self->_constraints;
  self->_constraints = v7;

}

- (void)_updateConstraintsWithImage
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *constraints;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  -[FLHeaderCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setContentMode:", 1);
  LODWORD(v4) = 1148846080;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 0, v4);
  _NSDictionaryOfVariableBindings(CFSTR("_followTitle, _followSubtitle, imageView"), self->_followTitle, self->_followSubtitle, v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(10)-[imageView(40)]-(10)-[_followTitle]-|"), 0, 0, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_followTitle, 5, 0, self->_followSubtitle, 5, 1.0, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_followTitle, 6, 0, self->_followSubtitle, 6, 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_followTitle]-[_followSubtitle]-11-|"), 0, 0, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-11-[imageView(40)]-(>=0)-|"), 0, 0, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_followTitle, 3, 0, v3, 3, 1.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v15;
  v17[1] = v6;
  v17[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11);
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  constraints = self->_constraints;
  self->_constraints = v12;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_followSubtitle, 0);
  objc_storeStrong((id *)&self->_followTitle, 0);
}

@end
