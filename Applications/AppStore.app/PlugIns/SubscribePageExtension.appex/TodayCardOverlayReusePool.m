@implementation TodayCardOverlayReusePool

- (void)clearStackFor:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _BYTE v11[24];

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_beginAccess(self->stack, v11, 1, 0);
  v9 = *(_QWORD *)self->stack;
  *(_QWORD *)self->stack = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease(v9);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end
