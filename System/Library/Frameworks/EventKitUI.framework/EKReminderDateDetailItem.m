@implementation EKReminderDateDetailItem

- (void)reset
{
  EKReminderDateDetailCell *cell;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKReminderDateDetailItem;
  -[EKEventDetailItem reset](&v4, sel_reset);
  cell = self->_cell;
  self->_cell = 0;

}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  return -[EKEvent completed](self->super._event, "completed", a3, a4);
}

- (void)setHidesBottomSeparator:(BOOL)a3
{
  EKReminderDateDetailCell *cell;

  self->_hidesBottomSeparator = a3;
  cell = self->_cell;
  if (cell)
    -[EKReminderDateDetailCell setHideBottomCellSeparator:](cell, "setHideBottomCellSeparator:");
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKReminderDateDetailCell *cell;
  EKReminderDateDetailCell *v5;
  EKReminderDateDetailCell *v6;

  cell = self->_cell;
  if (!cell)
  {
    v5 = -[EKReminderDateDetailCell initWithEvent:reminder:editable:]([EKReminderDateDetailCell alloc], "initWithEvent:reminder:editable:", self->super._event, self->super._reminder, 0);
    v6 = self->_cell;
    self->_cell = v5;

    -[EKReminderDateDetailCell setHideBottomCellSeparator:](self->_cell, "setHideBottomCellSeparator:", self->_hidesBottomSeparator);
    cell = self->_cell;
  }
  return cell;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  return *MEMORY[0x1E0DC53D8];
}

- (BOOL)hidesBottomSeparator
{
  return self->_hidesBottomSeparator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
