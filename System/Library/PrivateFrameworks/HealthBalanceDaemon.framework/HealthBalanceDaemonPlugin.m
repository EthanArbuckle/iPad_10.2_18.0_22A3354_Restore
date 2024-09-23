@implementation HealthBalanceDaemonPlugin

- (NSString)pluginIdentifier
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23DCE1D0C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setPluginIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_23DCE1D30();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HealthBalanceDaemon25HealthBalanceDaemonPlugin_pluginIdentifier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (id)extensionForHealthDaemon:(id)a3
{
  _TtC19HealthBalanceDaemon25HealthBalanceDaemonPlugin *v5;
  void *v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = (void *)sub_23DCA3E6C((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6;
}

- (id)extensionForProfile:(id)a3
{
  id v4;
  _TtC19HealthBalanceDaemon25HealthBalanceDaemonPlugin *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_23DCA40A0(v4);

  return v6;
}

+ (BOOL)shouldLoadPluginForDaemon:(id)a3
{
  id v4;
  unsigned __int8 v5;

  swift_unknownObjectRetain();
  v4 = objc_msgSend(a3, sel_behavior);
  v5 = objc_msgSend(v4, sel_isRealityDevice);
  swift_unknownObjectRelease();

  return v5 ^ 1;
}

- (_TtC19HealthBalanceDaemon25HealthBalanceDaemonPlugin)init
{
  uint64_t *v2;
  _TtC19HealthBalanceDaemon25HealthBalanceDaemonPlugin *v3;
  uint64_t v4;
  objc_super v6;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HealthBalanceDaemon25HealthBalanceDaemonPlugin_pluginIdentifier);
  v3 = self;
  *v2 = sub_23DCE1388();
  v2[1] = v4;

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for HealthBalanceDaemonPlugin();
  return -[HealthBalanceDaemonPlugin init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (id)taskServerClasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  sub_23DCA4E44();
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_23DCE3610;
  sub_23DC8F138(0, (unint64_t *)&unk_254324858, type metadata accessor for SleepingSampleAggregateDaySummaryEnumerator, sub_23DCA4ED4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for SleepingSampleDaySummaryQueryServer);
  *(_QWORD *)(v2 + 32) = v3;
  sub_23DC8F138(0, (unint64_t *)&unk_254324848, (uint64_t (*)(uint64_t))sub_23DC95408, sub_23DCA4EF0, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for SleepingSampleDaySummaryQueryServer);
  *(_QWORD *)(v2 + 40) = v4;
  *(_QWORD *)(v2 + 48) = type metadata accessor for TrainingLoadSummaryQueryServer();
  sub_23DCA4E98();
  v5 = (void *)sub_23DCE1DB4();
  swift_bridgeObjectRelease();
  return v5;
}

@end
