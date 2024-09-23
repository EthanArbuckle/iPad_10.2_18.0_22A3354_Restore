@implementation CDPPaneHeaderView

- (CDPPaneHeaderView)initWithFrame:(CGRect)a3
{
  CDPPaneHeaderView *v3;
  void *v4;
  objc_class *v5;
  id v6;
  uint64_t v7;
  BFFPaneHeaderView *header;
  objc_super v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v10.receiver = self;
  v10.super_class = (Class)CDPPaneHeaderView;
  v3 = -[CDPPaneHeaderView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v4 = (void *)getBFFPaneHeaderViewClass_softClass;
    v15 = getBFFPaneHeaderViewClass_softClass;
    if (!getBFFPaneHeaderViewClass_softClass)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __getBFFPaneHeaderViewClass_block_invoke;
      v11[3] = &unk_24C854C48;
      v11[4] = &v12;
      __getBFFPaneHeaderViewClass_block_invoke((uint64_t)v11);
      v4 = (void *)v13[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v12, 8);
    v6 = [v5 alloc];
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    header = v3->_header;
    v3->_header = (BFFPaneHeaderView *)v7;

    -[CDPPaneHeaderView addSubview:](v3, "addSubview:", v3->_header);
  }
  return v3;
}

- (UILabel)detailTextLabel
{
  return (UILabel *)-[BFFPaneHeaderView detailTextLabel](self->_header, "detailTextLabel");
}

- (UILabel)subLabel
{
  return (UILabel *)-[BFFPaneHeaderView subLabel](self->_header, "subLabel");
}

- (UILabel)textLabel
{
  return (UILabel *)-[BFFPaneHeaderView textLabel](self->_header, "textLabel");
}

- (void)setTitleText:(id)a3
{
  -[BFFPaneHeaderView setTitleText:](self->_header, "setTitleText:", a3);
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  -[BFFPaneHeaderView setLayoutMargins:](self->_header, "setLayoutMargins:", a3.top, a3.left, a3.bottom, a3.right);
}

- (void)layoutSubviews
{
  BFFPaneHeaderView *header;
  BFFPaneHeaderView *v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CDPPaneHeaderView;
  -[CDPPaneHeaderView layoutSubviews](&v7, sel_layoutSubviews);
  header = self->_header;
  -[CDPPaneHeaderView bounds](self, "bounds");
  -[BFFPaneHeaderView setFrame:](header, "setFrame:");
  v4 = self->_header;
  -[CDPPaneHeaderView bounds](self, "bounds");
  -[BFFPaneHeaderView sizeThatFits:](v4, "sizeThatFits:", v5, v6);
  -[BFFPaneHeaderView layoutSubviews](self->_header, "layoutSubviews");
}

- (UIView)_header
{
  return (UIView *)self->_header;
}

- (double)innerHeaderMaxY
{
  void *v3;
  void *v4;
  void *v5;
  BFFPaneHeaderView *header;
  void *v7;
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
  void *v20;
  double MaxY;
  CGRect v23;

  -[BFFPaneHeaderView subLabel](self->_header, "subLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDPPaneHeaderView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  header = self->_header;
  if (v4)
  {
    -[BFFPaneHeaderView subLabel](header, "subLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[BFFPaneHeaderView subLabel](self->_header, "subLabel");
  }
  else
  {
    -[BFFPaneHeaderView detailTextLabel](header, "detailTextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v16;
    v11 = v17;
    v13 = v18;
    v15 = v19;
    -[BFFPaneHeaderView detailTextLabel](self->_header, "detailTextLabel");
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertRect:fromView:", v20, v9, v11, v13, v15);
  MaxY = CGRectGetMaxY(v23);

  return MaxY;
}

- (void)makeAllTheTextFits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  -[CDPPaneHeaderView textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNumberOfLines:", 2);

  -[CDPPaneHeaderView textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", 1);

  -[CDPPaneHeaderView textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v6 = (void *)getBFFStyleClass_softClass_1;
  v20 = getBFFStyleClass_softClass_1;
  if (!getBFFStyleClass_softClass_1)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __getBFFStyleClass_block_invoke_1;
    v16[3] = &unk_24C854C48;
    v16[4] = &v17;
    __getBFFStyleClass_block_invoke_1((uint64_t)v16);
    v6 = (void *)v18[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v17, 8);
  objc_msgSend(v7, "sharedStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "headerTitleFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v9);

  -[CDPPaneHeaderView detailTextLabel](self, "detailTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BEBB520];
  v12 = *MEMORY[0x24BEBE1D0];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredFontForTextStyle:compatibleWithTraitCollection:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v15);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_header, 0);
}

@end
