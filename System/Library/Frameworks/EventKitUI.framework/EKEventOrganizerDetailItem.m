@implementation EKEventOrganizerDetailItem

- (void)reset
{
  UITableViewCell *cell;

  cell = self->_cell;
  self->_cell = 0;

}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;

  v5 = 16;
  -[EKEvent organizer](self->super._event, "organizer", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[EKEvent organizer](self->super._event, "organizer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend((id)v5, "isCurrentUser"))
    {
      v7 = 1;
LABEL_5:

      goto LABEL_6;
    }
  }
  -[EKEventOrganizerDetailItem organizerOverride](self, "organizerOverride");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8 != 0;

  if (v6)
    goto LABEL_5;
LABEL_6:

  return v7;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  UITableViewCell *cell;
  EKEventDetailOrganizerCell *v5;
  EKEvent *event;
  void *v7;
  UITableViewCell *v8;
  UITableViewCell *v9;

  cell = self->_cell;
  if (!cell)
  {
    v5 = [EKEventDetailOrganizerCell alloc];
    event = self->super._event;
    -[EKEventOrganizerDetailItem organizerOverride](self, "organizerOverride");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[EKEventDetailOrganizerCell initWithEvent:editable:organizerOverride:](v5, "initWithEvent:editable:organizerOverride:", event, 0, v7);
    v9 = self->_cell;
    self->_cell = v8;

    -[EKEventOrganizerDetailItem _updateDisclosureIndicator](self, "_updateDisclosureIndicator");
    cell = self->_cell;
  }
  return cell;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  _BOOL8 v5;
  double result;
  objc_super v10;

  v5 = a5;
  if (EKUIUnscaledCatalyst())
    return 65.0;
  v10.receiver = self;
  v10.super_class = (Class)EKEventOrganizerDetailItem;
  -[EKEventDetailItem defaultCellHeightForSubitemAtIndex:forWidth:forceUpdate:](&v10, sel_defaultCellHeightForSubitemAtIndex_forWidth_forceUpdate_, a3, v5, a4);
  return result;
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  void *v5;
  EKIdentityViewController *v6;

  -[EKEventOrganizerDetailItem organizerOverride](self, "organizerOverride", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (-[EKEvent organizer](self->super._event, "organizer"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = -[EKIdentityViewController initWithIdentity:]([EKIdentityViewController alloc], "initWithIdentity:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)setHideDisclosureIndicator:(BOOL)a3
{
  if (self->_hideDisclosureIndicator != a3)
  {
    self->_hideDisclosureIndicator = a3;
    -[EKEventOrganizerDetailItem _updateDisclosureIndicator](self, "_updateDisclosureIndicator");
  }
}

- (void)_updateDisclosureIndicator
{
  -[UITableViewCell setHideDisclosureIndicator:](self->_cell, "setHideDisclosureIndicator:", self->_hideDisclosureIndicator);
}

- (EKIdentityProtocol)organizerOverride
{
  return (EKIdentityProtocol *)objc_getProperty(self, a2, 96, 1);
}

- (void)setOrganizerOverride:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)hideDisclosureIndicator
{
  return self->_hideDisclosureIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizerOverride, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
