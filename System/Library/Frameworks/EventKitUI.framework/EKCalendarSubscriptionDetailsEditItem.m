@implementation EKCalendarSubscriptionDetailsEditItem

- (unint64_t)numberOfSubitems
{
  return 1;
}

- (BOOL)configureWithCalendar:(id)a3
{
  return objc_msgSend(a3, "isSubscribedHolidayCalendar") ^ 1;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3D50]);
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Subscription Details"), &stru_1E601DFA8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(v3, "setAccessoryType:", 1);
  return v3;
}

- (void)calendarEditor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  EKCalendarSubscriptionDetailsViewController *v8;

  v8 = -[EKCalendarSubscriptionDetailsViewController initWithCalendar:store:]([EKCalendarSubscriptionDetailsViewController alloc], "initWithCalendar:store:", self->super._calendar, self->super._store);
  -[EKCalendarEditItem delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarSubscriptionDetailsViewController setDelegate:](v8, "setDelegate:", v5);

  -[EKCalendarEditItem delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "owningNavigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v8, 1);

}

@end
