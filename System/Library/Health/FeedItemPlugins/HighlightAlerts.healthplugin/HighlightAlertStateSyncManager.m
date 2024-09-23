@implementation HighlightAlertStateSyncManager

- (_TtC15HighlightAlerts30HighlightAlertStateSyncManager)init
{
  _TtC15HighlightAlerts30HighlightAlertStateSyncManager *result;

  result = (_TtC15HighlightAlerts30HighlightAlertStateSyncManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_231470FF4((uint64_t)self + OBJC_IVAR____TtC15HighlightAlerts30HighlightAlertStateSyncManager_updateDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HighlightAlerts30HighlightAlertStateSyncManager_contextSyncStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HighlightAlerts30HighlightAlertStateSyncManager_cloudSyncControl));
}

- (NSString)description
{
  _TtC15HighlightAlerts30HighlightAlertStateSyncManager *v2;
  void *v3;

  v2 = self;
  sub_23147C114();

  v3 = (void *)sub_2314CA7E4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)deviceKeyValueStoreDidUpdateForStorageGroup:(id)a3
{
  unint64_t v4;
  _TtC15HighlightAlerts30HighlightAlertStateSyncManager *v5;

  sub_231469184(0, &qword_254163E40);
  v4 = sub_2314CA8BC();
  v5 = self;
  sub_23147E4E4(v4);

  swift_bridgeObjectRelease();
}

@end
