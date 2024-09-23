@implementation AXTripleClickTableViewCell

- (AXTripleClickTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AXTripleClickTableViewCell *v4;
  AXTripleClickTableViewCell *v5;
  void *v6;
  void *v7;
  UIView *v8;
  UIView *topLine;
  void *v10;
  UIView *v11;
  UIView *bottomLine;
  void *v13;
  AXTripleClickTableViewCell *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AXTripleClickTableViewCell;
  v4 = -[AXTripleClickTableViewCell initWithStyle:reuseIdentifier:](&v16, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[AXTripleClickTableViewCell textLabel](v4, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UISystemFontBoldForSize();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    v8 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    topLine = v5->_topLine;
    v5->_topLine = v8;

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.37);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5->_topLine, "setBackgroundColor:", v10);

    -[AXTripleClickTableViewCell addSubview:](v5, "addSubview:", v5->_topLine);
    v11 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    bottomLine = v5->_bottomLine;
    v5->_bottomLine = v11;

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5->_bottomLine, "setBackgroundColor:", v13);

    -[AXTripleClickTableViewCell addSubview:](v5, "addSubview:", v5->_bottomLine);
    v14 = v5;
  }

  return v5;
}

- (void)layoutSubviews
{
  UIView *topLine;
  UIView *bottomLine;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXTripleClickTableViewCell;
  -[AXTripleClickTableViewCell layoutSubviews](&v7, sel_layoutSubviews);
  topLine = self->_topLine;
  -[AXTripleClickTableViewCell frame](self, "frame");
  -[UIView setFrame:](topLine, "setFrame:", 0.0, 0.0);
  bottomLine = self->_bottomLine;
  -[AXTripleClickTableViewCell frame](self, "frame");
  v6 = v5 + -1.0;
  -[AXTripleClickTableViewCell frame](self, "frame");
  -[UIView setFrame:](bottomLine, "setFrame:", 0.0, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLine, 0);
  objc_storeStrong((id *)&self->_topLine, 0);
}

@end
