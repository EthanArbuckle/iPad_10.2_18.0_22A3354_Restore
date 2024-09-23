@implementation EKEventCommentDetailItem

- (void)reset
{
  EKEventDetailCommentCell *cell;

  cell = self->_cell;
  self->_cell = 0;

}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  if (-[EKEvent allowsParticipationStatusModifications](self->super._event, "allowsParticipationStatusModifications"))
  {
    objc_msgSend(v5, "source");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "supportsResponseComments"))
      v8 = -[EKEvent actionsState](self->super._event, "actionsState") == 0;
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  EKEventDetailCommentCell *cell;
  _BOOL4 v7;
  EKEventDetailCommentCell *v8;
  double v9;
  id v10;
  double v11;

  cell = self->_cell;
  if (cell)
  {
    v7 = a5;
    -[EKEventDetailCommentCell sizeToFit](cell, "sizeToFit", a3, a4);
    if (v7)
      -[EKEventDetailCommentCell update](self->_cell, "update");
    v8 = self->_cell;
    -[EKEventDetailCommentCell frame](v8, "frame");
    -[EKEventDetailCell layoutForWidth:position:](v8, "layoutForWidth:position:", -[EKEventDetailItem cellPosition](self, "cellPosition"), v9);
  }
  else
  {
    v10 = -[EKEventCommentDetailItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", a3, a5, a4);
    -[EKEventDetailCommentCell sizeToFit](self->_cell, "sizeToFit");
  }
  -[EKEventDetailCommentCell frame](self->_cell, "frame");
  return v11;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKEventDetailCommentCell *cell;
  EKEventDetailCommentCell *v5;
  EKEventDetailCommentCell *v6;
  void *v7;
  EKEventDetailCommentCell *v8;
  double v9;

  cell = self->_cell;
  if (!cell)
  {
    v5 = -[EKEventDetailCommentCell initWithEvent:editable:]([EKEventDetailCommentCell alloc], "initWithEvent:editable:", self->super._event, 1);
    v6 = self->_cell;
    self->_cell = v5;

    -[EKEventDetailCommentCell editableTextField](self->_cell, "editableTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

    -[EKEventDetailCommentCell update](self->_cell, "update");
    v8 = self->_cell;
    -[EKEventDetailCommentCell frame](v8, "frame");
    -[EKEventDetailCell layoutForWidth:position:](v8, "layoutForWidth:position:", -[EKEventDetailItem cellPosition](self, "cellPosition"), v9);
    cell = self->_cell;
  }
  return cell;
}

- (void)textFieldDidEndEditing:(id)a3
{
  EKEvent *event;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  event = self->super._event;
  v5 = a3;
  -[EKEvent responseComment](event, "responseComment");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEvent proposedStartDate](self->super._event, "proposedStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0D0CD90];
    -[EKEvent proposedStartDate](self->super._event, "proposedStartDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent timeZone](self->super._event, "timeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "comment:withInsertedAutoCommentForDate:timeZone:", v6, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  if (!objc_msgSend(v6, "length"))
  {

    v6 = 0;
  }
  if (objc_msgSend(v13, "length"))
  {
    v12 = v13;
  }
  else
  {

    v12 = 0;
  }
  v14 = v12;
  if ((CalEqualStrings() & 1) == 0)
    -[EKEvent setResponseComment:](self->super._event, "setResponseComment:", v6);
  -[EKEventDetailItem notifySubitemDidSave:](self, "notifySubitemDidSave:", 0);
  -[EKEventDetailItem editItemViewController:didCompleteWithAction:](self, "editItemViewController:didCompleteWithAction:", 0, 3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
