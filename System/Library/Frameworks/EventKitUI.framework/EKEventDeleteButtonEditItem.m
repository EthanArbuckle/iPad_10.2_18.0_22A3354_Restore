@implementation EKEventDeleteButtonEditItem

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  UITableViewCell *cell;
  EKUICenteredTextTableViewCell *v5;
  UITableViewCell *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  cell = self->_cell;
  if (!cell)
  {
    v5 = -[EKUICenteredTextTableViewCell initWithStyle:reuseIdentifier:]([EKUICenteredTextTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v6 = self->_cell;
    self->_cell = &v5->super.super;

    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGroupedBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell setBackgroundColor:](self->_cell, "setBackgroundColor:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "_systemDestructiveTintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell textLabel](self->_cell, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    EventKitUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Delete Event"), &stru_1E601DFA8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell textLabel](self->_cell, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

    cell = self->_cell;
  }
  return cell;
}

- (void)setDeleteButtonTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_deleteButtonTarget, a3);
  self->_deleteButtonAction = a4;
}

- (BOOL)shouldAppear
{
  void *v2;
  char v3;

  -[EKCalendarItemEditItem calendarItem](self, "calendarItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNew") ^ 1;

  return v3;
}

- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_deleteButtonTarget);
  objc_msgSend(WeakRetained, "performSelector:withObject:", self->_deleteButtonAction, self);

}

- (UIView)sourceViewForPopover
{
  return (UIView *)self->_cell;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_deleteButtonTarget);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
