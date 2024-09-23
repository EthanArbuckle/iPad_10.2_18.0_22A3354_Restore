@implementation CNFRegEmailLinkListCell

- (BOOL)canReload
{
  return 1;
}

- (CNFRegEmailLinkListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  CNFRegEmailLinkListCell *v5;
  CNFRegEmailLinkListCell *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNFRegEmailLinkListCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v11, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[CNFRegEmailLinkListCell detailTextLabel](v5, "detailTextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextAlignment:", 2);

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegEmailLinkListCell detailTextLabel](v6, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

  }
  return v6;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;
  uint64_t v15;
  _QWORD v16[2];
  CGRect v17;

  v16[1] = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)CNFRegEmailLinkListCell;
  -[PSTableCell layoutSubviews](&v14, sel_layoutSubviews);
  -[CNFRegEmailLinkListCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegEmailLinkListCell detailTextLabel](self, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v15 = *MEMORY[0x24BEBB360];
    objc_msgSend(v4, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(v4, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegEmailLinkListCell bounds](self, "bounds");
      objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 0, v5, 0, v11, v12);

    }
    -[CNFRegEmailLinkListCell contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    CGRectGetWidth(v17);

    objc_msgSend(v3, "frame");
    objc_msgSend(v3, "setFrame:");
    goto LABEL_6;
  }
LABEL_7:

}

@end
