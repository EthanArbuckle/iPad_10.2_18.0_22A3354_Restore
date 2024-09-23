@implementation EKEventTextDetailItem

- (void)reset
{
  EKEventDetailCell *cell;

  cell = self->_cell;
  self->_cell = 0;

}

- (void)setCellPosition:(int)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKEventTextDetailItem;
  -[EKEventDetailItem setCellPosition:](&v4, sel_setCellPosition_, *(_QWORD *)&a3);
  self->_cellNeedsUpdate = 1;
}

- (unint64_t)numberOfSubitems
{
  return 1;
}

- (void)_updateCellIfNeeded
{
  EKEventDetailCell *cell;
  double v4;

  if (self->_cellNeedsUpdate)
  {
    -[EKEventDetailCell update](self->_cell, "update");
    cell = self->_cell;
    -[EKEventDetailCell frame](cell, "frame");
    -[EKEventDetailCell layoutForWidth:position:](cell, "layoutForWidth:position:", -[EKEventDetailItem cellPosition](self, "cellPosition"), v4);
    self->_cellNeedsUpdate = 0;
  }
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  id v6;
  double v7;

  if (self->_cell)
  {
    if (a5)
      self->_cellNeedsUpdate = 1;
    -[EKEventTextDetailItem _updateCellIfNeeded](self, "_updateCellIfNeeded", a3, a4);
  }
  else
  {
    v6 = -[EKEventTextDetailItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", a3, a5, a4);
  }
  -[EKEventDetailCell bounds](self->_cell, "bounds");
  return v7;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKEventDetailCell *v4;
  EKEventDetailCell *cell;

  if (!self->_cell)
  {
    -[EKEventTextDetailItem _createEventDetailCell](self, "_createEventDetailCell", a3);
    v4 = (EKEventDetailCell *)objc_claimAutoreleasedReturnValue();
    cell = self->_cell;
    self->_cell = v4;

    self->_cellNeedsUpdate = 1;
  }
  -[EKEventTextDetailItem _updateCellIfNeeded](self, "_updateCellIfNeeded", a3);
  return self->_cell;
}

- (id)_createEventDetailCell
{
  EKEventDetailTextCell *v3;
  EKEvent *event;
  void *v5;
  void *v6;
  EKEventDetailTextCell *v7;

  v3 = [EKEventDetailTextCell alloc];
  event = self->super._event;
  objc_msgSend((id)objc_opt_class(), "titleForCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "textFromEventBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EKEventDetailTextCell initWithEvent:editable:title:textFromEventBlock:](v3, "initWithEvent:editable:title:textFromEventBlock:", event, 0, v5, v6);

  -[EKEventDetailTextCell setDelegate:](v7, "setDelegate:", self);
  return v7;
}

- (BOOL)requiresLayoutForSubitemCount
{
  return 1;
}

- (void)requestShowCellDetail
{
  EKEventDetailExtendedTextViewController *v3;
  void *v4;
  void *v5;
  EKEvent *event;
  void *v7;
  void *v8;
  void *v9;
  EKEventDetailExtendedTextViewController *v10;

  v3 = [EKEventDetailExtendedTextViewController alloc];
  -[EKEventTextDetailItem textForExtendedViewController](self, "textForExtendedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "titleForExtendedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  event = self->super._event;
  -[EKEventTextDetailItem textForCopyAction](self, "textForCopyAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[EKEventDetailExtendedTextViewController initWithText:title:event:textForCopyAction:](v3, "initWithText:title:event:textForCopyAction:", v4, v5, event, v7);

  -[EKEventDetailItem viewControllerToPresentFrom](self, "viewControllerToPresentFrom");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", v10, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
}

+ (id)titleForExtendedViewController
{
  id result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

+ (id)titleForCell
{
  id result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

+ (id)textFromEventBlock
{
  id result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (id)textForExtendedViewController
{
  id result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (id)textForCopyAction
{
  id result;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

@end
