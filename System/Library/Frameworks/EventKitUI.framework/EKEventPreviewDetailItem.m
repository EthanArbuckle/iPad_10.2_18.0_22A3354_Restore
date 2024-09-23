@implementation EKEventPreviewDetailItem

- (EKEventPreviewDetailItem)initWithModel:(id)a3
{
  id v5;
  EKEventPreviewDetailItem *v6;
  EKEventPreviewDetailItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKEventPreviewDetailItem;
  v6 = -[EKEventPreviewDetailItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_model, a3);

  return v7;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  -[EKEventPreviewDetailItem _reloadContainedViewControllerIfNeeded](self, "_reloadContainedViewControllerIfNeeded", a3, a4);
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
    -[EKEventPreviewDetailItem _datesForPreviewViewControllerWithStartDate:endDate:](self, "_datesForPreviewViewControllerWithStartDate:endDate:", &v6, &v5);
    v3 = v6;
    v4 = v5;
    -[EKDayPreviewController reloadWithNewDate:event:overriddenEventStartDate:overriddenEventEndDate:](self->_containedDayViewController, "reloadWithNewDate:event:overriddenEventStartDate:overriddenEventEndDate:", v3, self->super._event, v3, v4);

  }
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  EKDayPreviewController *containedDayViewController;
  double v6;
  double v7;

  containedDayViewController = self->_containedDayViewController;
  if (containedDayViewController)
  {
    -[EKDayPreviewController preferredContentSize](containedDayViewController, "preferredContentSize", a3, a5, a4);
    v7 = v6;
  }
  else
  {
    v7 = 1.0 / EKUIGoldenRatioPhi() * a4;
  }
  return CalCeilToScreenScale(v7);
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  UITableViewCell *cell;
  EKUITableViewCell *v5;
  UITableViewCell *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  cell = self->_cell;
  if (!cell)
  {
    v5 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
    v6 = self->_cell;
    self->_cell = &v5->super;

    -[EKEventPreviewDetailItem _dayPreviewViewController](self, "_dayPreviewViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidesAllDayEvents:", 1);
    if (-[EKEventPreviewDetailItem hideBottomSeparator](self, "hideBottomSeparator"))
      -[UITableViewCell setSeparatorInset:](self->_cell, "setSeparatorInset:", 0.0, 0.0, 0.0, 1.79769313e308);
    -[EKEventDetailItem delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewControllerForEventItem:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setHostingViewController:", v9);
    objc_msgSend(v9, "addChildViewController:", v7);
    objc_msgSend(v7, "didMoveToParentViewController:", v9);
    objc_msgSend(v7, "setRespectsSelectedCalendarsFilter:", -[EKEventPreviewDetailItem inlineDayViewRespectsSelectedCalendarsFilter](self, "inlineDayViewRespectsSelectedCalendarsFilter"));
    -[UITableViewCell contentView](self->_cell, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "addSubview:", v11);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 3, 0, v10, 3, 1.0, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addConstraint:", v12);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 4, 0, v10, 4, 1.0, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addConstraint:", v13);

    -[UITableViewCell setSelectionStyle:](self->_cell, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 5, 0, self->_cell, 17, 1.0, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 6, 0, self->_cell, 18, 1.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3718];
    v19[0] = v14;
    v19[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v17);

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
  -[EKEventPreviewDetailItem proposedTime](self, "proposedTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[EKEventPreviewDetailItem proposedTime](self, "proposedTime");
    v9 = objc_claimAutoreleasedReturnValue();

    -[EKEvent endDateUnadjustedForLegacyClients](self->super._event, "endDateUnadjustedForLegacyClients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent startDate](self->super._event, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v11);
    v13 = v12;

    v14 = (void *)MEMORY[0x1E0C99D68];
    -[EKEventPreviewDetailItem proposedTime](self, "proposedTime");
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
  uint64_t v4;
  double v5;
  id v6;
  id v7;
  EKDayPreviewController *v8;
  EKDayPreviewController *v9;
  id v11;
  id v12;

  containedDayViewController = self->_containedDayViewController;
  if (!containedDayViewController)
  {
    if (-[EKEvent isIntegrationEvent](self->super._event, "isIntegrationEvent"))
      v4 = 5;
    else
      v4 = 0;
    if (-[EKEvent isIntegrationEvent](self->super._event, "isIntegrationEvent"))
      v5 = 1.0;
    else
      v5 = 0.8;
    v11 = 0;
    v12 = 0;
    -[EKEventPreviewDetailItem _datesForPreviewViewControllerWithStartDate:endDate:](self, "_datesForPreviewViewControllerWithStartDate:endDate:", &v12, &v11);
    v6 = v12;
    v7 = v11;
    v8 = -[EKDayPreviewController initWithDate:event:overriddenEventStartDate:overriddenEventEndDate:model:overriddenDayViewHourScale:overriddenDayViewMinHourRange:]([EKDayPreviewController alloc], "initWithDate:event:overriddenEventStartDate:overriddenEventEndDate:model:overriddenDayViewHourScale:overriddenDayViewMinHourRange:", v6, self->super._event, v6, v7, self->_model, v4, v5);
    v9 = self->_containedDayViewController;
    self->_containedDayViewController = v8;

    containedDayViewController = self->_containedDayViewController;
  }
  return containedDayViewController;
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  return 0;
}

- (void)eventViewController:(id)a3 didSelectReadOnlySubitem:(unint64_t)a4
{
  id v5;
  _QWORD v6[5];

  v5 = a3;
  if (self->_cell && (-[EKEvent isIntegrationEvent](self->super._event, "isIntegrationEvent") & 1) == 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __73__EKEventPreviewDetailItem_eventViewController_didSelectReadOnlySubitem___block_invoke;
    v6[3] = &unk_1E6018688;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 7, v6, &__block_literal_global_12, 0.5, 0.0, 1.0, 0.0);
  }

}

uint64_t __73__EKEventPreviewDetailItem_eventViewController_didSelectReadOnlySubitem___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "toggleExpandedState");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventDetailItemWantsRefeshForHeightChange");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "layoutSubviews");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "layoutBelowIfNeeded");
}

- (BOOL)inlineDayViewRespectsSelectedCalendarsFilter
{
  return self->_inlineDayViewRespectsSelectedCalendarsFilter;
}

- (void)setInlineDayViewRespectsSelectedCalendarsFilter:(BOOL)a3
{
  self->_inlineDayViewRespectsSelectedCalendarsFilter = a3;
}

- (NSDate)proposedTime
{
  return self->_proposedTime;
}

- (void)setProposedTime:(id)a3
{
  objc_storeStrong((id *)&self->_proposedTime, a3);
}

- (BOOL)hideBottomSeparator
{
  return self->_hideBottomSeparator;
}

- (void)setHideBottomSeparator:(BOOL)a3
{
  self->_hideBottomSeparator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedTime, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_containedDayViewController, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
