@implementation DefaultUserActivityReportCoordinator

- (void)configureWithDetectors:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25573FD20);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_221917374(0, &qword_255741160);
  v7 = sub_222596E40();
  v8 = sub_222596EF4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = self;
  v9[5] = v7;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_22191760C((uint64_t)v6, (uint64_t)&unk_255741170, (uint64_t)v9);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)sendCoordinatedReportsForReason:(unint64_t)a3
{
  swift_retain();
  sub_2219D40C4(a3);
  swift_release();
}

- (_TtC13HomeKitDaemon36DefaultUserActivityReportCoordinator)init
{
  _TtC13HomeKitDaemon36DefaultUserActivityReportCoordinator *result;

  swift_defaultActor_initialize();
  result = (_TtC13HomeKitDaemon36DefaultUserActivityReportCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)handleBackgroundTaskManagerTimerFiredWithNotification:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_2219D67A8(v3);

  swift_release();
}

- (void)handleStateChangeForDetectorOfType:(unint64_t)a3 withReason:(unint64_t)a4
{
  swift_retain();
  sub_2219D7D98(a3, a4);
  swift_release();
}

@end
