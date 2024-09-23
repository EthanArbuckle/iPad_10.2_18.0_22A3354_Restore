@implementation EKEventTitleDetailItem

- (void)reset
{
  self->_cellNeedsUpdate = 1;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  return 1;
}

- (void)setEvent:(id)a3 reminder:(id)a4 store:(id)a5
{
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EKEventTitleDetailItem;
  v8 = a3;
  -[EKEventDetailItem setEvent:reminder:store:](&v9, sel_setEvent_reminder_store_, v8, a4, a5);
  -[EKEventDetailCell setEvent:](self->_cell, "setEvent:", v8, v9.receiver, v9.super_class);

}

- (void)setCellPosition:(int)a3
{
  uint64_t v3;
  objc_super v5;

  v3 = *(_QWORD *)&a3;
  if (-[EKEventDetailItem cellPosition](self, "cellPosition") != a3)
    self->_cellNeedsUpdate = 1;
  v5.receiver = self;
  v5.super_class = (Class)EKEventTitleDetailItem;
  -[EKEventDetailItem setCellPosition:](&v5, sel_setCellPosition_, v3);
}

- (void)_updateCellIfNeededForWidth:(double)a3
{
  if (self->_cellNeedsUpdate)
  {
    -[EKEventDetailTitleCell update](self->_cell, "update");
    -[EKEventDetailTitleCell layoutForWidth:position:](self->_cell, "layoutForWidth:position:", -[EKEventDetailItem cellPosition](self, "cellPosition"), a3);
    self->_cellNeedsUpdate = 0;
  }
}

- (double)titleHeight
{
  double result;

  -[EKEventDetailTitleCell titleHeight](self->_cell, "titleHeight");
  return result;
}

- (void)setHidesTopSeparator:(BOOL)a3
{
  EKEventDetailTitleCell *cell;

  self->_hidesTopSeparator = a3;
  cell = self->_cell;
  if (cell)
    -[EKEventDetailTitleCell setHideTopCellSeparator:](cell, "setHideTopCellSeparator:");
}

- (void)setHidesBottomSeparator:(BOOL)a3
{
  EKEventDetailTitleCell *cell;

  self->_hidesBottomSeparator = a3;
  cell = self->_cell;
  if (cell)
    -[EKEventDetailTitleCell setHideBottomCellSeparator:](cell, "setHideBottomCellSeparator:");
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  id v6;
  double v7;

  if (self->_cell)
  {
    if (a5)
      self->_cellNeedsUpdate = 1;
    -[EKEventTitleDetailItem _updateCellIfNeededForWidth:](self, "_updateCellIfNeededForWidth:", a3, a4);
  }
  else
  {
    v6 = -[EKEventTitleDetailItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", 0, a5, a4);
  }
  -[EKEventDetailTitleCell frame](self->_cell, "frame");
  return v7;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKEventDetailTitleCell *cell;
  EKEventDetailTitleCell *v5;
  EKEventDetailTitleCell *v6;
  double v7;

  cell = self->_cell;
  if (!cell)
  {
    v5 = -[EKEventDetailCell initWithEvent:editable:]([EKEventDetailTitleCell alloc], "initWithEvent:editable:", self->super._event, 0);
    -[EKEventDetailTitleCell setNumberOfTitleLines:](v5, "setNumberOfTitleLines:", -[EKEventTitleDetailItem numberOfTitleLines](self, "numberOfTitleLines"));
    -[EKEventDetailTitleCell setDelegate:](v5, "setDelegate:", self);
    if (-[EKEventTitleDetailItem hidesBottomSeparator](self, "hidesBottomSeparator"))
      -[EKEventDetailTitleCell setHideBottomCellSeparator:](v5, "setHideBottomCellSeparator:", 1);
    if (-[EKEventTitleDetailItem hidesTopSeparator](self, "hidesTopSeparator"))
      -[EKEventDetailTitleCell setHideTopCellSeparator:](v5, "setHideTopCellSeparator:", 1);
    -[EKEventDetailTitleCell setHasMapItemLaunchOptionFromTimeToLeaveNotification:](v5, "setHasMapItemLaunchOptionFromTimeToLeaveNotification:", -[EKEventTitleDetailItem hasMapItemLaunchOptionFromTimeToLeaveNotification](self, "hasMapItemLaunchOptionFromTimeToLeaveNotification"));
    v6 = self->_cell;
    self->_cell = v5;

    self->_cellNeedsUpdate = 1;
    cell = self->_cell;
  }
  -[EKEventDetailTitleCell frame](cell, "frame", a3);
  -[EKEventTitleDetailItem _updateCellIfNeededForWidth:](self, "_updateCellIfNeededForWidth:", v7);
  return self->_cell;
}

- (void)setNumberOfTitleLines:(unint64_t)a3
{
  if (self->_numberOfTitleLines != a3)
  {
    self->_numberOfTitleLines = a3;
    -[EKEventDetailTitleCell setNumberOfTitleLines:](self->_cell, "setNumberOfTitleLines:");
  }
}

- (void)refreshCopiedEvents
{
  -[EKEventDetailTitleCell update](self->_cell, "update");
}

- (UIView)sourceViewForPopover
{
  return -[EKEventDetailTitleCell sourceViewForPopover](self->_cell, "sourceViewForPopover");
}

- (void)editButtonPressed
{
  id v2;

  -[EKEventTitleDetailItem editDelegate](self, "editDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editButtonPressed");

}

- (BOOL)shouldShowEditButtonInline
{
  void *v3;
  void *v4;
  char v5;

  -[EKEventTitleDetailItem editDelegate](self, "editDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[EKEventTitleDetailItem editDelegate](self, "editDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldShowEditButtonInline");

  return v5;
}

- (BOOL)shouldShowNextButton
{
  void *v3;
  void *v4;
  char v5;

  -[EKEventTitleDetailItem editDelegate](self, "editDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[EKEventTitleDetailItem editDelegate](self, "editDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldShowNextButton");

  return v5;
}

- (BOOL)shouldShowPreviousButton
{
  void *v3;
  void *v4;
  char v5;

  -[EKEventTitleDetailItem editDelegate](self, "editDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[EKEventTitleDetailItem editDelegate](self, "editDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldShowPreviousButton");

  return v5;
}

- (void)nextButtonPressed
{
  id v2;

  -[EKEventTitleDetailItem editDelegate](self, "editDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextButtonPressed");

}

- (void)previousButtonPressed
{
  id v2;

  -[EKEventTitleDetailItem editDelegate](self, "editDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previousButtonPressed");

}

- (void)predictionWasActedOn
{
  -[EKEventDetailItem notifySubitemDidSave:](self, "notifySubitemDidSave:", 0);
}

- (BOOL)minimalMode
{
  void *v2;
  char v3;

  -[EKEventTitleDetailItem editDelegate](self, "editDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "minimalMode");

  return v3;
}

- (id)owningViewController
{
  void *v3;
  void *v4;

  -[EKEventDetailItem delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerForEventItem:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)showsDetectedConferenceItem
{
  void *v2;
  char v3;

  -[EKEventDetailItem delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsDetectedConferenceItem");

  return v3;
}

- (void)refreshForHeightChange
{
  id v2;

  -[EKEventDetailItem delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventDetailItemWantsRefeshForHeightChange");

}

- (NSDate)proposedTime
{
  return self->_proposedTime;
}

- (BOOL)titleCellShouldPresentShareSheet:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;

  -[EKEventDetailItem delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 1;
  -[EKEventDetailItem delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "eventDetailItemShouldPresentShareSheet:", self);

  return v7;
}

- (void)titleCell:(id)a3 requestPresentShareSheetWithActivityItems:(id)a4 withPopoverSourceView:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  -[EKEventDetailItem delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[EKEventDetailItem delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "eventDetailItem:requestPresentShareSheetWithActivityItems:withPopoverSourceView:", self, v11, v7);

  }
}

- (BOOL)hidesTopSeparator
{
  return self->_hidesTopSeparator;
}

- (BOOL)hidesBottomSeparator
{
  return self->_hidesBottomSeparator;
}

- (void)setProposedTime:(id)a3
{
  objc_storeStrong((id *)&self->_proposedTime, a3);
}

- (EKEventTitleDetailItemDelegate)editDelegate
{
  return (EKEventTitleDetailItemDelegate *)objc_loadWeakRetained((id *)&self->_editDelegate);
}

- (void)setEditDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_editDelegate, a3);
}

- (BOOL)hasMapItemLaunchOptionFromTimeToLeaveNotification
{
  return self->_hasMapItemLaunchOptionFromTimeToLeaveNotification;
}

- (void)setHasMapItemLaunchOptionFromTimeToLeaveNotification:(BOOL)a3
{
  self->_hasMapItemLaunchOptionFromTimeToLeaveNotification = a3;
}

- (unint64_t)numberOfTitleLines
{
  return self->_numberOfTitleLines;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_editDelegate);
  objc_storeStrong((id *)&self->_proposedTime, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
