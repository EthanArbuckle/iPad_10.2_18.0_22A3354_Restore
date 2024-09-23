@implementation CUIKIPendingReminderTracker

- (CUIKIPendingReminderTracker)initWithEventStore:(id)a3
{
  id v4;
  CUIKIPendingReminderTracker *v5;
  _TtC21CalendarUIKitInternal22PendingReminderTracker *v6;
  _TtC21CalendarUIKitInternal22PendingReminderTracker *impl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CUIKIPendingReminderTracker;
  v5 = -[CUIKIPendingReminderTracker init](&v9, sel_init);
  if (v5)
  {
    v6 = -[PendingReminderTracker initWithEventStore:]([_TtC21CalendarUIKitInternal22PendingReminderTracker alloc], "initWithEventStore:", v4);
    impl = v5->_impl;
    v5->_impl = v6;

  }
  return v5;
}

- (void)addPendingEvent:(id)a3 sequenceNumber:(int)a4
{
  -[PendingReminderTracker addPendingWithEvent:sequenceNumber:](self->_impl, "addPendingWithEvent:sequenceNumber:", a3, *(_QWORD *)&a4);
}

- (void)setOptimisticReminder:(id)a3 forEvent:(id)a4 sequenceNumber:(int)a5
{
  -[PendingReminderTracker setOptimisticReminderWithEvent:sequenceNumber:optimisticReminder:](self->_impl, "setOptimisticReminderWithEvent:sequenceNumber:optimisticReminder:", a4, *(_QWORD *)&a5, a3);
}

- (id)optimisticReminderForEvent:(id)a3
{
  return -[PendingReminderTracker optimisticReminderFor:](self->_impl, "optimisticReminderFor:", a3);
}

- (id)impl
{
  return self->_impl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
