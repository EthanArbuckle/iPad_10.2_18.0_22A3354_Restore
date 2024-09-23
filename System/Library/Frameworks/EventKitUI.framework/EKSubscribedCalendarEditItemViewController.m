@implementation EKSubscribedCalendarEditItemViewController

- (EKSubscribedCalendarEditItemViewController)initWithFrame:(CGRect)a3 calendar:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  EKSubscribedCalendarEditItemViewController *v11;
  EKSubscribedCalendarEditItemViewController *v12;
  void *v13;
  void *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EKSubscribedCalendarEditItemViewController;
  v11 = -[EKEditItemViewController initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_calendar, a4);
    EventKitUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Edit Calendar"), &stru_1E601DFA8, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSubscribedCalendarEditItemViewController setTitle:](v12, "setTitle:", v14);

    -[EKEditItemViewController setShowsDoneButton:](v12, "setShowsDoneButton:", 1);
    -[EKEditItemViewController setModal:](v12, "setModal:", 1);
  }

  return v12;
}

- (void)loadView
{
  id v3;
  EKSubscribedCalendarEditor *v4;
  EKCalendar *calendar;
  void *v6;
  EKAbstractCalendarEditor *v7;
  EKAbstractCalendarEditor *calendarEditor;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v19 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  objc_msgSend(v19, "setAutoresizingMask:", 18);
  v4 = [EKSubscribedCalendarEditor alloc];
  calendar = self->_calendar;
  -[EKCalendar eventStore](calendar, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EKSubscribedCalendarEditor initWithCalendar:eventStore:entityType:limitedToSource:](v4, "initWithCalendar:eventStore:entityType:limitedToSource:", calendar, v6, 0, 0);
  calendarEditor = self->_calendarEditor;
  self->_calendarEditor = v7;

  -[EKSubscribedCalendarEditItemViewController addChildViewController:](self, "addChildViewController:", self->_calendarEditor);
  -[EKAbstractCalendarEditor didMoveToParentViewController:](self->_calendarEditor, "didMoveToParentViewController:", self);
  -[EKAbstractCalendarEditor view](self->_calendarEditor, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v9);

  objc_msgSend(v19, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[EKAbstractCalendarEditor view](self->_calendarEditor, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  -[EKSubscribedCalendarEditItemViewController setView:](self, "setView:", v19);
}

- (CGSize)preferredContentSize
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  v14.receiver = self;
  v14.super_class = (Class)EKSubscribedCalendarEditItemViewController;
  -[EKEditItemViewController preferredContentSize](&v14, sel_preferredContentSize);
  v4 = v3;
  -[EKAbstractCalendarEditor view](self->_calendarEditor, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v7 = v6;

  -[EKSubscribedCalendarEditItemViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v7 + v10;

  v12 = v4;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)save
{
  -[EKAbstractCalendarEditor saveChanges](self->_calendarEditor, "saveChanges");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarEditor, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
