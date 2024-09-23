@implementation MTBaseSessionsProvider

+ (BOOL)supportsSessions
{
  char v2;

  sub_1B8DFD970();
  sub_1B8DFD964();
  v2 = sub_1B8DFD958();
  swift_release();
  return v2 & 1;
}

- (int64_t)numberOfStopwatchSessions
{
  _TtC18MobileTimerSupport22MTBaseSessionsProvider *v3;
  unint64_t v4;
  int64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED36F0B8);
  v3 = self;
  v4 = sub_1B8DFD8BC();
  if (v4 >> 62)
    v5 = sub_1B8DFDFB8();
  else
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);

  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC18MobileTimerSupport22MTBaseSessionsProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MTBaseSessionsProvider();
  return -[MTBaseSessionsProvider init](&v3, sel_init);
}

@end
