@implementation SUUIGiftAmountSection

- (UIControl)amountControl
{
  SUUIGiftAmountControl *amountControl;
  SUUIGiftAmountControl *v4;
  void *v5;
  SUUIGiftAmountControl *v6;
  SUUIGiftAmountControl *v7;

  amountControl = self->_amountControl;
  if (!amountControl)
  {
    v4 = [SUUIGiftAmountControl alloc];
    -[SUUIGiftTableViewSection giftConfiguration](self, "giftConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SUUIGiftAmountControl initWithGiftConfiguration:](v4, "initWithGiftConfiguration:", v5);
    v7 = self->_amountControl;
    self->_amountControl = v6;

    -[SUUIGiftAmountControl setAutoresizingMask:](self->_amountControl, "setAutoresizingMask:", 18);
    amountControl = self->_amountControl;
  }
  return (UIControl *)amountControl;
}

- (int64_t)selectedAmount
{
  return -[SUUIGiftAmountControl selectedAmount](self->_amountControl, "selectedAmount");
}

- (NSString)selectedAmountString
{
  return -[SUUIGiftAmountControl selectedAmountString](self->_amountControl, "selectedAmountString");
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  void *v4;
  uint64_t v5;
  double result;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  result = 152.0;
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 116.0;
  return result;
}

- (int64_t)numberOfRowsInSection
{
  return 1;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("GAM"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, CFSTR("GAM"));
    objc_msgSend(v5, "setSelectionStyle:", 0);
  }
  -[SUUIGiftAmountSection amountControl](self, "amountControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "setFrame:");
  objc_msgSend(v7, "addSubview:", v6);

  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forIndexPath:(id)a5
{
  id v7;
  id v8;

  v7 = a4;
  objc_msgSend(a3, "backgroundColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIGiftAmountControl setBackgroundColor:](self->_amountControl, "setBackgroundColor:", v8);
  objc_msgSend(v7, "setBackgroundColor:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amountControl, 0);
}

@end
