@implementation CalendarSheet.CalendarCoordinator

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  void (*v4)(int64_t);
  id v7;
  _TtCV15ShazamEventsApp13CalendarSheet19CalendarCoordinator *v8;

  v4 = *(void (**)(int64_t))((char *)&self->super.isa
                                             + OBJC_IVAR____TtCV15ShazamEventsApp13CalendarSheet19CalendarCoordinator_completionHandler);
  if (v4)
  {
    v7 = a3;
    v8 = self;
    v4(a4);

  }
}

- (_TtCV15ShazamEventsApp13CalendarSheet19CalendarCoordinator)init
{
  _TtCV15ShazamEventsApp13CalendarSheet19CalendarCoordinator *result;

  result = (_TtCV15ShazamEventsApp13CalendarSheet19CalendarCoordinator *)_swift_stdlib_reportUnimplementedInitializer("ShazamEventsApp.CalendarCoordinator", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100020BA0(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCV15ShazamEventsApp13CalendarSheet19CalendarCoordinator_completionHandler), *(_QWORD *)&self->completionHandler[OBJC_IVAR____TtCV15ShazamEventsApp13CalendarSheet19CalendarCoordinator_completionHandler]);
}

@end
