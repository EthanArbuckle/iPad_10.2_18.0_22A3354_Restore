@implementation EKEventShowInCalendarDetailItem

- (EKEventShowInCalendarDetailItem)initWithModel:(id)a3
{
  id v5;
  EKEventShowInCalendarDetailItem *v6;
  EKEventShowInCalendarDetailItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKEventShowInCalendarDetailItem;
  v6 = -[EKEventShowInCalendarDetailItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_model, a3);

  return v7;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  -[EKEventShowInCalendarDetailItem _reloadContainedViewControllerIfNeeded](self, "_reloadContainedViewControllerIfNeeded", a3, a4);
  return 1;
}

- (void)_reloadContainedViewControllerIfNeeded
{
  id v3;
  id v4;
  id v5;
  id v6;

  if (self->_containedDayViewController)
  {
    v5 = 0;
    v6 = 0;
    -[EKEventShowInCalendarDetailItem _datesForPreviewViewControllerWithStartDate:endDate:](self, "_datesForPreviewViewControllerWithStartDate:endDate:", &v6, &v5);
    v3 = v6;
    v4 = v5;
    -[EKDayPreviewController reloadWithNewDate:event:overriddenEventStartDate:overriddenEventEndDate:](self->_containedDayViewController, "reloadWithNewDate:event:overriddenEventStartDate:overriddenEventEndDate:", v3, self->super._event, v3, v4);

  }
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  double result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEventShowInCalendarDetailItem;
  -[EKEventDetailItem defaultCellHeightForSubitemAtIndex:forWidth:](&v5, sel_defaultCellHeightForSubitemAtIndex_forWidth_, a3, a4);
  return result;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKUITableViewCell *cell;
  EKUITableViewCell *v5;
  EKUITableViewCell *v6;
  void *v7;
  void *v8;
  void *v9;

  cell = self->_cell;
  if (!cell)
  {
    v5 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
    v6 = self->_cell;
    self->_cell = v5;

    -[EKUITableViewCell setAccessoryType:](self->_cell, "setAccessoryType:", 1);
    EventKitUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Show in Calendar"), &stru_1E601DFA8, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUITableViewCell textLabel](self->_cell, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    cell = self->_cell;
  }
  return cell;
}

- (void)_datesForPreviewViewControllerWithStartDate:(id *)a3 endDate:(id *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  -[EKEvent startDate](self->super._event, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventShowInCalendarDetailItem proposedTime](self, "proposedTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[EKEventShowInCalendarDetailItem proposedTime](self, "proposedTime");
    v9 = objc_claimAutoreleasedReturnValue();

    -[EKEvent endDateUnadjustedForLegacyClients](self->super._event, "endDateUnadjustedForLegacyClients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent startDate](self->super._event, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v11);
    v13 = v12;

    v14 = (void *)MEMORY[0x1E0C99D68];
    -[EKEventShowInCalendarDetailItem proposedTime](self, "proposedTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateWithTimeInterval:sinceDate:", v15, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  else
  {
    v16 = 0;
  }
  v18 = objc_retainAutorelease(v7);
  *a3 = v18;
  v17 = objc_retainAutorelease(v16);
  *a4 = v17;

}

- (id)_dayPreviewViewController
{
  EKDayPreviewController *containedDayViewController;
  id v4;
  id v5;
  EKDayPreviewController *v6;
  EKDayPreviewController *v7;
  id v9;
  id v10;

  containedDayViewController = self->_containedDayViewController;
  if (!containedDayViewController)
  {
    v9 = 0;
    v10 = 0;
    -[EKEventShowInCalendarDetailItem _datesForPreviewViewControllerWithStartDate:endDate:](self, "_datesForPreviewViewControllerWithStartDate:endDate:", &v10, &v9);
    v4 = v10;
    v5 = v9;
    v6 = -[EKDayPreviewController initWithDate:event:overriddenEventStartDate:overriddenEventEndDate:model:]([EKDayPreviewController alloc], "initWithDate:event:overriddenEventStartDate:overriddenEventEndDate:model:", v4, self->super._event, v4, v5, self->_model);
    v7 = self->_containedDayViewController;
    self->_containedDayViewController = v6;

    -[EKDayPreviewController setStyle:](self->_containedDayViewController, "setStyle:", 2);
    containedDayViewController = self->_containedDayViewController;
  }
  return containedDayViewController;
}

- (NSDate)proposedTime
{
  return self->_proposedTime;
}

- (void)setProposedTime:(id)a3
{
  objc_storeStrong((id *)&self->_proposedTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedTime, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_containedDayViewController, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
