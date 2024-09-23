@implementation ManualSummaryController

- (_TtC6MailUI23ManualSummaryController)init
{
  return (_TtC6MailUI23ManualSummaryController *)ManualSummaryController.init()();
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;

  v3 = OBJC_IVAR____TtC6MailUI23ManualSummaryController_logger;
  v2 = sub_1D565F084();
  (*(void (**)(char *))(*(_QWORD *)(v2 - 8) + 8))((char *)self + v3);
  swift_release();
  sub_1D5565788();
  swift_unknownObjectWeakDestroy();
  sub_1D55CD374((uint64_t)self + OBJC_IVAR____TtC6MailUI23ManualSummaryController_summaryRequest);
  sub_1D55CD8C8((uint64_t)self + OBJC_IVAR____TtC6MailUI23ManualSummaryController_summaryResponse);
}

@end
