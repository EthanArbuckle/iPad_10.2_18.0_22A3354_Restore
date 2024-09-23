@implementation EKEventAttendeesDetailItem

- (EKEventAttendeesDetailItem)initWithModel:(id)a3
{
  id v5;
  EKEventAttendeesDetailItem *v6;
  EKEventAttendeesDetailItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKEventAttendeesDetailItem;
  v6 = -[EKEventAttendeesDetailItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_model, a3);

  return v7;
}

- (void)reset
{
  EKEventDetailAttendeesCell *oldCell;
  EKEventDetailAttendeesCell *v4;
  EKEventDetailAttendeesCell *cell;

  if (-[EKEventDetailAttendeesCell loadingAttendees](self->_cell, "loadingAttendees"))
  {
    oldCell = self->_oldCell;
    self->_oldCell = 0;
  }
  else
  {
    v4 = self->_cell;
    oldCell = self->_oldCell;
    self->_oldCell = v4;
  }

  cell = self->_cell;
  self->_cell = 0;

}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  void *v5;
  double v6;
  double v7;

  -[EKEventAttendeesDetailItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", a3, a5, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayHeight");
  v7 = v6;

  return v7;
}

- (unint64_t)numberOfSubitems
{
  return 1;
}

- (void)eventViewController:(id)a3 didSelectSubitem:(unint64_t)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKEventAttendeesDetailItem;
  -[EKEventDetailItem eventViewController:didSelectSubitem:](&v4, sel_eventViewController_didSelectSubitem_, a3, a4);
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  return -[EKEvent hasHumanInviteesToDisplay](self->super._event, "hasHumanInviteesToDisplay", a3, a4);
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKEventDetailAttendeesCell *cell;
  EKEventDetailAttendeesCellModel *attendeesModel;
  EKEventDetailAttendeesCellModel *v6;
  EKEventDetailAttendeesCellModel *v7;
  EKEventDetailAttendeesCell *v8;
  EKEventDetailAttendeesCell *v9;
  _BOOL4 v10;
  EKEventDetailAttendeesCell *oldCell;

  cell = self->_cell;
  if (!cell)
  {
    attendeesModel = self->_attendeesModel;
    if (!attendeesModel)
    {
      v6 = objc_alloc_init(EKEventDetailAttendeesCellModel);
      v7 = self->_attendeesModel;
      self->_attendeesModel = v6;

      attendeesModel = self->_attendeesModel;
    }
    -[EKEventDetailAttendeesCellModel setEvent:](attendeesModel, "setEvent:", self->super._event);
    v8 = -[EKEventDetailAttendeesCell initWithEvent:model:]([EKEventDetailAttendeesCell alloc], "initWithEvent:model:", self->super._event, self->_attendeesModel);
    v9 = self->_cell;
    self->_cell = v8;

    -[EKEventDetailAttendeesCell setAttendeeCellDelegate:](self->_cell, "setAttendeeCellDelegate:", self);
    -[EKEventDetailAttendeesCell update](self->_cell, "update");
    -[EKEventDetailAttendeesCell layoutForWidth:position:](self->_cell, "layoutForWidth:position:", -[EKEventDetailItem cellPosition](self, "cellPosition"), 300.0);
    cell = self->_cell;
  }
  v10 = -[EKEventDetailAttendeesCell loadingAttendees](cell, "loadingAttendees", a3);
  oldCell = self->_oldCell;
  if (!v10)
  {
    if (oldCell)
    {
      self->_oldCell = 0;

    }
    goto LABEL_10;
  }
  if (!oldCell)
LABEL_10:
    oldCell = self->_cell;
  return oldCell;
}

- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3
{
  return -[EKEvent hasHumanInviteesToDisplay](self->super._event, "hasHumanInviteesToDisplay", a3);
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  EKUIEventInviteesViewController *v5;
  void *v6;
  void *v7;

  v5 = -[EKUIEventInviteesViewController initWithEvent:fromDetail:model:]([EKUIEventInviteesViewController alloc], "initWithEvent:fromDetail:model:", self->super._event, 1, self->_model);
  -[EKEventDetailItem viewControllerToPresentFrom](self, "viewControllerToPresentFrom");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesViewController setNavigationDelegate:](v5, "setNavigationDelegate:", v7);

  return v5;
}

- (void)eventDetailAttendeeCellWantsRefreshForHeightChange
{
  id v2;

  -[EKEventDetailItem delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventDetailItemWantsRefeshForHeightChange");

}

- (void)eventDetailAttendeeCellDidCompleteLoad:(id)a3
{
  EKEventDetailAttendeesCell *v4;
  void *v5;
  EKEventDetailAttendeesCell *v6;

  v4 = (EKEventDetailAttendeesCell *)a3;
  if (self->_oldCell && self->_cell == v4)
  {
    v6 = v4;
    -[EKEventDetailItem delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventDetailItemWantsRefresh:", self);

    v4 = v6;
  }

}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSArray)attendees
{
  return self->_attendees;
}

- (void)setAttendees:(id)a3
{
  objc_storeStrong((id *)&self->_attendees, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attendees, 0);
  objc_storeStrong((id *)&self->_oldCell, 0);
  objc_storeStrong((id *)&self->_attendeesModel, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
