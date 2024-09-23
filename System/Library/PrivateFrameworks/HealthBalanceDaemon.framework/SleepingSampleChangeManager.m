@implementation SleepingSampleChangeManager

- (void)dealloc
{
  _TtC19HealthBalanceDaemon27SleepingSampleChangeManager *v2;

  v2 = self;
  sub_23DC9D320();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthBalanceDaemon27SleepingSampleChangeManager_dataManager));
  swift_release();
  swift_release();
  sub_23DC97390(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19HealthBalanceDaemon27SleepingSampleChangeManager_unitTest_didBeginObservingSleepingSampleDataTypes));
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4;
  _TtC19HealthBalanceDaemon27SleepingSampleChangeManager *v5;

  v4 = a3;
  v5 = self;
  sub_23DC9F2A0();

}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  sub_23DC9E10C(self, (uint64_t)a2, (uint64_t)a3, a4, (unint64_t *)&unk_254324A20, 0x24BDD3ED8, (void (*)(uint64_t))sub_23DC9F448);
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  sub_23DC9E10C(self, (uint64_t)a2, (uint64_t)a3, a4, (unint64_t *)&qword_254324988, 0x24BDD3F08, (void (*)(uint64_t))sub_23DC9F82C);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC19HealthBalanceDaemon27SleepingSampleChangeManager *v14;
  uint64_t v15;
  id v16;
  _TtC19HealthBalanceDaemon27SleepingSampleChangeManager *v17;
  _OWORD v18[2];

  if (a3)
  {
    v10 = sub_23DCE1D30();
    v12 = v11;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v18, 0, sizeof(v18));
    v16 = a5;
    v17 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  v12 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain();
  v13 = a5;
  v14 = self;
  sub_23DCE2000();
  swift_unknownObjectRelease();
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_23DC9F0D8();
  v15 = sub_23DCE1C7C();

LABEL_8:
  sub_23DC9E188(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23DC9505C((uint64_t)v18);
}

- (_TtC19HealthBalanceDaemon27SleepingSampleChangeManager)init
{
  _TtC19HealthBalanceDaemon27SleepingSampleChangeManager *result;

  result = (_TtC19HealthBalanceDaemon27SleepingSampleChangeManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
