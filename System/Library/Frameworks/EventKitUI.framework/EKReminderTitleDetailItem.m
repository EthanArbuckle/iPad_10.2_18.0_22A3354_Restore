@implementation EKReminderTitleDetailItem

- (void)reset
{
  EKReminderTitleDetailCell *cell;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKReminderTitleDetailItem;
  -[EKEventDetailItem reset](&v4, sel_reset);
  cell = self->_cell;
  self->_cell = 0;

}

- (void)setShowExtraSpaceAtBottom:(BOOL)a3
{
  EKReminderTitleDetailCell *cell;

  self->_showExtraSpaceAtBottom = a3;
  cell = self->_cell;
  if (cell)
    -[EKReminderTitleDetailCell setShowExtraSpaceAtBottom:](cell, "setShowExtraSpaceAtBottom:");
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKReminderTitleDetailCell *cell;
  EKReminderTitleDetailCell *v5;
  EKReminderTitleDetailCell *v6;

  cell = self->_cell;
  if (!cell)
  {
    v5 = -[EKReminderTitleDetailCell initWithEvent:reminder:editable:delegate:]([EKReminderTitleDetailCell alloc], "initWithEvent:reminder:editable:delegate:", self->super._event, self->super._reminder, 0, self);
    v6 = self->_cell;
    self->_cell = v5;

    -[EKReminderTitleDetailCell setShowExtraSpaceAtBottom:](self->_cell, "setShowExtraSpaceAtBottom:", self->_showExtraSpaceAtBottom);
    cell = self->_cell;
  }
  return cell;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[EKReminderTitleDetailItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", a3, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 1148846080;
  LODWORD(v8) = 1112014848;
  objc_msgSend(v6, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a4, 1000.0, v7, v8);
  v10 = v9;

  return v10;
}

- (void)editButtonPressed
{
  id v2;

  -[EKReminderTitleDetailItem editDelegate](self, "editDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editButtonPressed");

}

- (BOOL)shouldShowEditButtonInline
{
  void *v3;
  void *v4;
  char v5;

  -[EKReminderTitleDetailItem editDelegate](self, "editDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[EKReminderTitleDetailItem editDelegate](self, "editDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldShowEditButtonInline");

  return v5;
}

- (void)reminderToggled
{
  EKEvent *v3;

  v3 = self->super._event;
  -[EKEvent setCompleted:](v3, "setCompleted:", -[EKEvent completed](v3, "completed") ^ 1);

  -[EKEventDetailItem notifySubitemDidSave:](self, "notifySubitemDidSave:", 0);
  -[EKEventDetailItem editItemViewController:didCompleteWithAction:](self, "editItemViewController:didCompleteWithAction:", 0, 3);
}

- (EKReminderTitleDetailItemDelegate)editDelegate
{
  return (EKReminderTitleDetailItemDelegate *)objc_loadWeakRetained((id *)&self->_editDelegate);
}

- (void)setEditDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_editDelegate, a3);
}

- (BOOL)showExtraSpaceAtBottom
{
  return self->_showExtraSpaceAtBottom;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_editDelegate);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
