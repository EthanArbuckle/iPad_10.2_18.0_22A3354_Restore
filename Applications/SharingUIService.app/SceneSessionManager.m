@implementation SceneSessionManager

- (void)didReceiveMemoryWarning:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = qword_10003EE00;
  swift_retain(self);
  if (v9 != -1)
    swift_once(&qword_10003EE00, sub_10000B14C);
  v10 = type metadata accessor for Logger(0);
  v11 = sub_10000A054(v10, (uint64_t)qword_100041CE8);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "didReceiveMemoryWarning", v14, 2u);
    swift_slowDealloc(v14, -1, -1);
  }

  sub_100013CE4(0);
  swift_release(self);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end
