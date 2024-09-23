@implementation EKReminderUneditableButtonDetailItem

- (EKReminderUneditableButtonDetailItem)initWithUneditableButtonDetailItemDelegate:(id)a3
{
  id v5;
  EKReminderUneditableButtonDetailItem *v6;
  EKReminderUneditableButtonDetailItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKReminderUneditableButtonDetailItem;
  v6 = -[EKReminderUneditableButtonDetailItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_uneditableButtonDetailItemDelegate, a3);

  return v7;
}

- (void)reset
{
  EKReminderUneditableButtonDetailCell *cell;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKReminderUneditableButtonDetailItem;
  -[EKEventDetailItem reset](&v4, sel_reset);
  cell = self->_cell;
  self->_cell = 0;

}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKReminderUneditableButtonDetailCell *cell;
  EKReminderUneditableButtonDetailCell *v5;
  EKReminderUneditableButtonDetailItem *v6;
  EKReminderUneditableButtonDetailCell *v7;
  EKReminderUneditableButtonDetailCell *v8;

  cell = self->_cell;
  if (!cell)
  {
    v5 = [EKReminderUneditableButtonDetailCell alloc];
    if (self->_uneditableButtonDetailItemDelegate)
      v6 = self;
    else
      v6 = 0;
    v7 = -[EKReminderUneditableButtonDetailCell initWithEvent:uneditableButtonCellDelegate:](v5, "initWithEvent:uneditableButtonCellDelegate:", self->super._event, v6);
    v8 = self->_cell;
    self->_cell = v7;

    cell = self->_cell;
  }
  return cell;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  return -[EKEvent CUIK_reminderShouldBeEditable](self->super._event, "CUIK_reminderShouldBeEditable", a3, a4) ^ 1;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  return *MEMORY[0x1E0DC53D8];
}

- (void)uneditableButtonCellRequestedShowFirstUncompletedReminder:(id)a3
{
  id v4;

  -[EKEvent CUIK_currentReminder](self->super._event, "CUIK_currentReminder", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKReminderUneditableButtonDetailItemDelegate uneditableButtonDetailItem:requestsShowEvent:](self->_uneditableButtonDetailItemDelegate, "uneditableButtonDetailItem:requestsShowEvent:", self, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uneditableButtonDetailItemDelegate, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
