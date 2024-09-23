@implementation EKCalendarButtonEditItem

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKUICenteredTextTableViewCell *v4;
  UITableViewCell *cell;
  void *v6;
  void *v7;
  NSString *buttonTitle;
  void *v9;
  void *v10;

  if (!self->_cell)
  {
    v4 = -[EKUICenteredTextTableViewCell initWithStyle:reuseIdentifier:]([EKUICenteredTextTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    cell = self->_cell;
    self->_cell = &v4->super.super;

    objc_msgSend(MEMORY[0x1E0DC3658], "_systemDestructiveTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell textLabel](self->_cell, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v6);

    buttonTitle = self->_buttonTitle;
    -[UITableViewCell textLabel](self->_cell, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", buttonTitle);

  }
  objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGroupedBackgroundColor", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell setBackgroundColor:](self->_cell, "setBackgroundColor:", v10);

  return self->_cell;
}

- (void)setButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTitle, a3);
}

- (void)setButtonTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_buttonTarget, a3);
  self->_buttonAction = a4;
}

- (UIView)buttonView
{
  return (UIView *)self->_cell;
}

- (void)calendarEditor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_buttonTarget);
  objc_msgSend(WeakRetained, "performSelector:withObject:", self->_buttonAction, self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_destroyWeak(&self->_buttonTarget);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
