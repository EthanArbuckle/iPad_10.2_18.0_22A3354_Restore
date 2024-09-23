@implementation DashboardViewModel

- (void)reloadDataWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  uint64_t v14;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = swift_retain(self);
  sub_1001D40BC(v9, v10, v11, v12);
  v13 = swift_release(self);
  (*(void (**)(char *, uint64_t, __n128))(v6 + 8))(v8, v5, v13);
}

- (void)checLoadingStateWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __n128 v10;
  uint64_t v11;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = *(_QWORD *)(*(_QWORD *)&self->metrics[7] + 16);
  swift_retain(self);
  sub_1001D4B98(v9, 0);
  v10 = swift_release(self);
  (*(void (**)(char *, uint64_t, __n128))(v6 + 8))(v8, v5, v10);
}

@end
