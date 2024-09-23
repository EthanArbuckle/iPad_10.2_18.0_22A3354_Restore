@implementation EKEventImportedNoticeDetailItem

- (void)reset
{
  EKEventDetailImportedNoticeCell *cell;

  cell = self->_cell;
  self->_cell = 0;

}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  void *v5;
  void *v6;
  int v7;

  -[EKEvent organizer](self->super._event, "organizer", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[EKEvent selfAttendee](self->super._event, "selfAttendee");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      LOBYTE(v7) = 0;
    else
      v7 = -[EKEvent isEditable](self->super._event, "isEditable") ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  EKEventDetailImportedNoticeCell *cell;
  _BOOL4 v7;
  EKEventDetailImportedNoticeCell *v8;
  double v9;
  id v10;
  double v11;

  cell = self->_cell;
  if (cell)
  {
    v7 = a5;
    -[EKEventDetailImportedNoticeCell sizeToFit](cell, "sizeToFit", a3, a4);
    if (v7)
      -[EKEventDetailImportedNoticeCell update](self->_cell, "update");
    v8 = self->_cell;
    -[EKEventDetailImportedNoticeCell frame](v8, "frame");
    -[EKEventDetailCell layoutForWidth:position:](v8, "layoutForWidth:position:", -[EKEventDetailItem cellPosition](self, "cellPosition"), v9);
  }
  else
  {
    v10 = -[EKEventImportedNoticeDetailItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", a3, a5, a4);
    -[EKEventDetailImportedNoticeCell sizeToFit](self->_cell, "sizeToFit");
  }
  -[EKEventDetailImportedNoticeCell frame](self->_cell, "frame");
  return v11;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKEventDetailImportedNoticeCell *cell;
  EKEventDetailImportedNoticeCell *v5;
  EKEventDetailImportedNoticeCell *v6;

  cell = self->_cell;
  if (!cell)
  {
    v5 = -[EKEventDetailImportedNoticeCell initWithEvent:editable:]([EKEventDetailImportedNoticeCell alloc], "initWithEvent:editable:", self->super._event, 1);
    v6 = self->_cell;
    self->_cell = v5;

    cell = self->_cell;
  }
  return cell;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
