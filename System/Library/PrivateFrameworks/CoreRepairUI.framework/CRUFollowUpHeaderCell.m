@implementation CRUFollowUpHeaderCell

+ (int64_t)cellStyle
{
  return 3;
}

- (id)createFollowUpTitle
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;

  v2 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v2, "setNumberOfLines:", 0);
  objc_msgSend(v2, "setLineBreakMode:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  objc_msgSend(MEMORY[0x24BE75530], "appearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v2, "setTextColor:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setTextColor:", v6);

  }
  LODWORD(v7) = 1144750080;
  objc_msgSend(v2, "setContentCompressionResistancePriority:forAxis:", 0, v7);
  return v2;
}

- (id)createFollowUpSubtitle
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;

  v2 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(MEMORY[0x24BE75530], "appearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v2, "setTextColor:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setTextColor:", v5);

  }
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v2, "setNumberOfLines:", 0);
  objc_msgSend(v2, "setLineBreakMode:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v6);

  LODWORD(v7) = 1144750080;
  objc_msgSend(v2, "setContentCompressionResistancePriority:forAxis:", 0, v7);
  return v2;
}

- (CRUFollowUpHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  CRUFollowUpHeaderCell *v5;
  CRUFollowUpHeaderCell *v6;
  uint64_t v7;
  UILabel *followTitle;
  uint64_t v9;
  UILabel *followSubtitle;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CRUFollowUpHeaderCell;
  v5 = -[CRUFollowUpHeaderCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[CRUFollowUpHeaderCell createFollowUpTitle](v5, "createFollowUpTitle");
    v7 = objc_claimAutoreleasedReturnValue();
    followTitle = v6->_followTitle;
    v6->_followTitle = (UILabel *)v7;

    -[CRUFollowUpHeaderCell createFollowUpSubtitle](v6, "createFollowUpSubtitle");
    v9 = objc_claimAutoreleasedReturnValue();
    followSubtitle = v6->_followSubtitle;
    v6->_followSubtitle = (UILabel *)v9;

    -[CRUFollowUpHeaderCell contentView](v6, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v6->_followTitle);
    objc_msgSend(v11, "addSubview:", v6->_followSubtitle);
    -[CRUFollowUpHeaderCell layoutSubviews](v6, "layoutSubviews");

  }
  return v6;
}

- (void)handleTapOnLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BDBCF48];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "localizedStringWithKey:defaultString:", CFSTR("PART_SERVICE_HISTORY_URL"), CFSTR("PART_SERVICE_HISTORY_URL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "openURL:configuration:completionHandler:", v5, 0, 0);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRUFollowUpHeaderCell;
  -[PSTableCell layoutSubviews](&v3, sel_layoutSubviews);
  -[CRUFollowUpHeaderCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  UILabel *followSubtitle;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CRUFollowUpHeaderCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v18, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE1B2C8], v18.receiver, v18.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_followTitle, "setText:", v6);

  v7 = (void *)objc_opt_new();
  v8 = objc_alloc(MEMORY[0x24BDD1688]);
  objc_msgSend(v5, "informativeText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithString:", v9);

  objc_msgSend(v5, "informativeText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithKey:defaultString:", CFSTR("LEARN_MORE_ELLIPSE"), CFSTR("LEARN_MORE_ELLIPSE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "rangeOfString:", v12);
  v15 = v14;

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x24BEBB388], CFSTR("http://www.apple.com"), v13, v15);
  -[UILabel setAttributedText:](self->_followSubtitle, "setAttributedText:", v10);
  -[UILabel setUserInteractionEnabled:](self->_followSubtitle, "setUserInteractionEnabled:", 1);
  followSubtitle = self->_followSubtitle;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_handleTapOnLabel);
  -[UILabel addGestureRecognizer:](followSubtitle, "addGestureRecognizer:", v17);

  -[CRUFollowUpHeaderCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *constraints;
  objc_super v10;

  objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_constraints);
  _NSDictionaryOfVariableBindings(CFSTR("_followTitle, _followSubtitle"), self->_followTitle, self->_followSubtitle, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_followTitle]-|"), 0, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_followSubtitle]-|"), 0, 0, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-11-[_followTitle]-[_followSubtitle]-11-|"), 0, 0, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v6);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  constraints = self->_constraints;
  self->_constraints = v8;

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_constraints);
  v10.receiver = self;
  v10.super_class = (Class)CRUFollowUpHeaderCell;
  -[CRUFollowUpHeaderCell updateConstraints](&v10, sel_updateConstraints);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_followSubtitle, 0);
  objc_storeStrong((id *)&self->_followTitle, 0);
}

@end
