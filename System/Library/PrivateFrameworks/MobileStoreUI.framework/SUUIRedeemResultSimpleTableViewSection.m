@implementation SUUIRedeemResultSimpleTableViewSection

- (SUUIRedeemResultSimpleTableViewSection)initWithView:(id)a3
{
  id v5;
  SUUIRedeemResultSimpleTableViewSection *v6;
  SUUIRedeemResultSimpleTableViewSection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIRedeemResultSimpleTableViewSection;
  v6 = -[SUUIRedeemResultSimpleTableViewSection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_view, a3);

  return v7;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  double v5;

  -[UIView bounds](self->_view, "bounds", a3, a4);
  return v5 + self->_contentInsets.top + self->_contentInsets.bottom;
}

- (int64_t)numberOfRowsInSection
{
  return 1;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  SUUIRedeemResultSimpleTableViewCell *v5;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("SUUIRRSTVC"), a4);
  v5 = (SUUIRedeemResultSimpleTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[SUUIRedeemResultSimpleTableViewCell initWithStyle:reuseIdentifier:]([SUUIRedeemResultSimpleTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("SUUIRRSTVC"));
    -[SUUIRedeemResultSimpleTableViewCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
  }
  -[SUUIRedeemResultSimpleTableViewCell setChildContentInsets:](v5, "setChildContentInsets:", self->_contentInsets.top, self->_contentInsets.left, self->_contentInsets.bottom, self->_contentInsets.right);
  -[SUUIRedeemResultSimpleTableViewCell setChildContentView:](v5, "setChildContentView:", self->_view);
  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forIndexPath:(id)a5
{
  id v7;
  id v8;

  v7 = a4;
  objc_msgSend(a3, "backgroundColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  -[UIView setBackgroundColor:](self->_view, "setBackgroundColor:", v8);
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

@end
