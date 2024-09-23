@implementation VSNotificationHistoryViewController

- (void)viewDidLoad
{
  _TtC12AutoSettings35VSNotificationHistoryViewController *v2;

  v2 = self;
  sub_100005D40();

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12AutoSettings35VSNotificationHistoryViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1000066A8(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4 < 1)
    return 0;
  else
    return objc_msgSend(objc_allocWithZone((Class)UIView), "init", v4, v5);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  result = 0.0;
  if (a4 > 0)
    return 12.0;
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  unsigned __int8 *v3;
  _BYTE v5[24];

  v3 = &self->superclass_opaque[OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_notificationsBySeverity];
  swift_beginAccess(&self->superclass_opaque[OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_notificationsBySeverity], v5, 0, 0);
  return *(_QWORD *)(*(_QWORD *)v3 + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC12AutoSettings35VSNotificationHistoryViewController *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;

  v6 = a3;
  v7 = self;
  v8 = sub_1000065B4(a4);
  if (v8)
  {
    v9 = v8;
    if ((unint64_t)v8 >> 62)
    {
      if (v8 >= 0)
        v8 &= 0xFFFFFFFFFFFFFF8uLL;
      v10 = _CocoaArrayWrapper.endIndex.getter(v8);
    }
    else
    {
      v10 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }

    swift_bridgeObjectRelease(v9);
  }
  else
  {

    return 0;
  }
  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12AutoSettings35VSNotificationHistoryViewController *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v14 = (void *)sub_100006A64(v11, v10, v13);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (void)historicalNotificationService:(id)a3 didUpdateName:(id)a4
{
  id v5;
  _TtC12AutoSettings35VSNotificationHistoryViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100006034();

}

- (void)historicalNotificationService:(id)a3 didUpdateUserVisibleFullDescription:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC12AutoSettings35VSNotificationHistoryViewController *v9;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_100006034();

  swift_bridgeObjectRelease(v7);
}

- (void)historicalNotificationService:(id)a3 didUpdateTimestamp:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  _TtC12AutoSettings35VSNotificationHistoryViewController *v13;
  uint64_t v14;

  v7 = sub_100005888((uint64_t *)&unk_100027E70);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100005904(0, (unint64_t *)&unk_100028620, NSUnitDuration_ptr);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a4, v11);
  v12 = a3;
  v13 = self;
  sub_100006034();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)historicalNotificationService:(id)a3 didUpdateNotificationSeverity:(unsigned __int8)a4
{
  id v5;
  _TtC12AutoSettings35VSNotificationHistoryViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100006034();

}

- (void)historicalNotificationService:(id)a3 didUpdateHistoricalNotificationUserActions:(id)a4
{
  id v6;
  id v7;
  _TtC12AutoSettings35VSNotificationHistoryViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100006034();

}

- (void)historicalNotificationService:(id)a3 didUpdateHidden:(BOOL)a4
{
  id v5;
  _TtC12AutoSettings35VSNotificationHistoryViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100006034();

}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->superclass_opaque[OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_requestContentManager]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->superclass_opaque[OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_notificationsBySeverity]);
}

@end
