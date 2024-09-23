@implementation SummariesAppDelegate

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC9Summaries20SummariesAppDelegate *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_23212D6F0((uint64_t (*)(_QWORD))sub_23212E5B4, v9);

  swift_release();
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC9Summaries20SummariesAppDelegate *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_23212D8A8(v11, (uint64_t)sub_23212D6E4, v9);

  swift_release();
}

- (_TtC9Summaries20SummariesAppDelegate)init
{
  _TtC9Summaries20SummariesAppDelegate *result;

  sub_2321306C4();
  return result;
}

- (void).cxx_destruct
{

  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9Summaries20SummariesAppDelegate_healthSharingNotificationSyncStore));
  swift_bridgeObjectRelease();
}

@end
