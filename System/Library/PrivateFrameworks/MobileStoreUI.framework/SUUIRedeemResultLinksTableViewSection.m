@implementation SUUIRedeemResultLinksTableViewSection

- (SUUIRedeemResultLinksTableViewSection)initWithLinks:(id)a3
{
  id v4;
  SUUIRedeemResultLinksTableViewSection *v5;
  uint64_t v6;
  NSArray *links;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIRedeemResultLinksTableViewSection;
  v5 = -[SUUIRedeemResultLinksTableViewSection init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    links = v5->_links;
    v5->_links = (NSArray *)v6;

  }
  return v5;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  return 44.0;
}

- (int64_t)numberOfRowsInSection
{
  return -[NSArray count](self->_links, "count");
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  id v6;
  SUUITableViewCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSUInteger v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("SUUIRRLTVC"));
  v7 = (SUUITableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[SUUITableViewCell initWithStyle:reuseIdentifier:]([SUUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("SUUIRRLTVC"));
    -[SUUITableViewCell setAccessoryType:](v7, "setAccessoryType:", 1);
    -[SUUITableViewCell textLabel](v7, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUITableViewCell setTopBorderColor:](v7, "setTopBorderColor:", v10);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[SUUITableViewCell setBorderPaddingLeft:](v7, "setBorderPaddingLeft:", 30.0);
    -[SUUITableViewCell setTextLabelInsets:](v7, "setTextLabelInsets:", 0.0, 15.0, 0.0, -15.0);
  }
  v13 = -[NSArray count](self->_links, "count");
  if (objc_msgSend(v6, "row") == v13 - 1)
    -[SUUITableViewCell setBottomBorderColor:](v7, "setBottomBorderColor:", v10);
  -[NSArray objectAtIndex:](self->_links, "objectAtIndex:", objc_msgSend(v6, "row"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUITableViewCell textLabel](v7, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v16);

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forIndexPath:(id)a5
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "backgroundColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

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
  objc_storeStrong((id *)&self->_links, 0);
}

@end
