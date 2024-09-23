@implementation EKShowInRemindersDetailItem

- (void)reset
{
  EKShowInRemindersDetailCell *cell;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKShowInRemindersDetailItem;
  -[EKEventDetailItem reset](&v4, sel_reset);
  cell = self->_cell;
  self->_cell = 0;

}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKShowInRemindersDetailCell *cell;
  EKShowInRemindersDetailCell *v5;
  EKShowInRemindersDetailCell *v6;

  cell = self->_cell;
  if (!cell)
  {
    v5 = -[EKShowInRemindersDetailCell initWithEvent:editable:]([EKShowInRemindersDetailCell alloc], "initWithEvent:editable:", self->super._event, 0);
    v6 = self->_cell;
    self->_cell = v5;

    cell = self->_cell;
  }
  return cell;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  return *MEMORY[0x1E0DC53D8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
