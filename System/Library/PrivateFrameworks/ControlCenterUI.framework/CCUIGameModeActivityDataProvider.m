@implementation CCUIGameModeActivityDataProvider

- (NSSet)activityData
{
  void *v2;

  swift_beginAccess();
  sub_1CFBBAA24(0, &qword_1ED90AE30);
  sub_1CFBC02D0();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1CFBFA978();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (void)setActivityData:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  sub_1CFBBAA24(0, &qword_1ED90AE30);
  sub_1CFBC02D0();
  v4 = sub_1CFBFA984();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_activityData);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (unint64_t)gameModeState
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_gameModeState);
  swift_beginAccess();
  return *v2;
}

- (void)setGameModeState:(unint64_t)a3
{
  unint64_t *v4;

  v4 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_gameModeState);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)gameModeAAA
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_gameModeAAA;
  swift_beginAccess();
  return *v2;
}

- (void)setGameModeAAA:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_gameModeAAA;
  swift_beginAccess();
  *v4 = a3;
}

- (_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider)initWithDelegate:(id)a3
{
  swift_unknownObjectRetain();
  return (_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider *)CCUIGameModeActivityDataProvider.init(delegate:)();
}

- (int64_t)stateForBundleIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC15ControlCenterUI32CCUIGameModeActivityDataProvider *v7;
  int64_t v8;

  v4 = sub_1CFBFA894();
  v6 = v5;
  v7 = self;
  v8 = sub_1CFBBC4B8(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void)setWithState:(int64_t)a3 forBundleIdentifier:(id)a4 callback:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC15ControlCenterUI32CCUIGameModeActivityDataProvider *v11;

  v7 = _Block_copy(a5);
  v8 = sub_1CFBFA894();
  v10 = v9;
  _Block_copy(v7);
  v11 = self;
  sub_1CFBBFC74(a3, v8, v10, (uint64_t)v11, (void (**)(_QWORD, _QWORD))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider)init
{
  _TtC15ControlCenterUI32CCUIGameModeActivityDataProvider *result;

  result = (_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1CFBB85D8((uint64_t)self + OBJC_IVAR____TtC15ControlCenterUI32CCUIGameModeActivityDataProvider_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
