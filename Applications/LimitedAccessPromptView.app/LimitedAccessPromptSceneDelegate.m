@implementation LimitedAccessPromptSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  _TtC23LimitedAccessPromptView32LimitedAccessPromptSceneDelegate *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  id v17;

  v8 = qword_100026330;
  v9 = a3;
  v10 = a4;
  v17 = a5;
  v11 = self;
  if (v8 != -1)
    swift_once(&qword_100026330, sub_100016010);
  v12 = type metadata accessor for Logger(0);
  v13 = sub_100005110(v12, (uint64_t)qword_100027D10);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.default.getter(v14);
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "LimitedAccessPromptSceneDelegate willConnectToWithOptions", v16, 2u);
    swift_slowDealloc(v16, -1, -1);
  }

}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  _TtC23LimitedAccessPromptView32LimitedAccessPromptSceneDelegate *v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_100015E50(v6, v8);

  swift_bridgeObjectRelease(v8);
}

- (_TtC23LimitedAccessPromptView32LimitedAccessPromptSceneDelegate)init
{
  return (_TtC23LimitedAccessPromptView32LimitedAccessPromptSceneDelegate *)sub_100015504(self, (uint64_t)a2, type metadata accessor for LimitedAccessPromptSceneDelegate);
}

@end
