@implementation SUUIGiftSendDateSection

- (UIEdgeInsets)headerInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[SUUIGiftSendDateSection _headerView](self, "_headerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setHeaderInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  id v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[SUUIGiftSendDateSection _headerView](self, "_headerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentInsets:", top, left, bottom, right);
  objc_msgSend(v7, "sizeToFit");

}

- (void)setSendDate:(id)a3
{
  NSDate *v4;
  NSDate *v5;
  NSDate *sendDate;
  NSDate *v7;

  v4 = (NSDate *)a3;
  if (self->_sendDate != v4)
  {
    v7 = v4;
    if (v4)
    {
      v5 = (NSDate *)-[NSDate copy](v4, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    sendDate = self->_sendDate;
    self->_sendDate = v5;

    v4 = v7;
  }

}

- (void)updateCell:(id)a3 forTransitionToSize:(CGSize)a4
{
  objc_msgSend(a3, "setDate:", self->_sendDate, a4.width, a4.height);
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  return 45.0;
}

- (int64_t)numberOfRowsInSection
{
  return 1;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  SUUIGiftDateTableViewCell *v5;
  void *v6;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("GDT"), a4);
  v5 = (SUUIGiftDateTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[SUUIGiftDateTableViewCell initWithStyle:reuseIdentifier:]([SUUIGiftDateTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("GDT"));
    -[SUUIGiftTableViewSection giftConfiguration](self, "giftConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftDateTableViewCell setGiftConfiguration:](v5, "setGiftConfiguration:", v6);

  }
  -[SUUIGiftDateTableViewCell setChecked:](v5, "setChecked:", 1);
  -[SUUIGiftDateTableViewCell setDate:](v5, "setDate:", self->_sendDate);
  -[SUUIGiftDateTableViewCell setDelegate:](v5, "setDelegate:", self);
  -[SUUIGiftDateTableViewCell setPlaceholder:](v5, "setPlaceholder:", 0);
  return v5;
}

- (id)_headerView
{
  SUUIGiftTableSectionHeaderView *headerView;
  void *v4;
  void *v5;
  SUUIGiftTableSectionHeaderView *v6;
  SUUIGiftTableSectionHeaderView *v7;
  SUUIGiftTableSectionHeaderView *v8;
  void *v9;

  headerView = self->_headerView;
  if (!headerView)
  {
    -[SUUIGiftTableViewSection giftConfiguration](self, "giftConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(SUUIGiftTableSectionHeaderView);
    v7 = self->_headerView;
    self->_headerView = v6;

    v8 = self->_headerView;
    if (v5)
      objc_msgSend(v5, "localizedStringForKey:inTable:", CFSTR("GIFTING_DATE_SECTION_HEADER"), CFSTR("Gifting"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("GIFTING_DATE_SECTION_HEADER"), 0, CFSTR("Gifting"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIGiftTableSectionHeaderView setLabel:](v8, "setLabel:", v9);

    -[SUUIGiftTableSectionHeaderView sizeToFit](self->_headerView, "sizeToFit");
    headerView = self->_headerView;
  }
  return headerView;
}

- (void)giftDateTableViewCell:(id)a3 didChangeDate:(id)a4
{
  id v6;
  id WeakRetained;

  objc_storeStrong((id *)&self->_sendDate, a4);
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "giftSendDateSection:didChangeDate:", self, v6);

}

- (SUUIGiftSendDateSectionDelegate)delegate
{
  return (SUUIGiftSendDateSectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SUUIItem)giftItem
{
  return self->_giftItem;
}

- (void)setGiftItem:(id)a3
{
  objc_storeStrong((id *)&self->_giftItem, a3);
}

- (NSDate)sendDate
{
  return self->_sendDate;
}

- (int64_t)sendDateStyle
{
  return self->_sendDateStyle;
}

- (void)setSendDateStyle:(int64_t)a3
{
  self->_sendDateStyle = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sendDate, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_giftItem, 0);
}

@end
