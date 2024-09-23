@implementation ODINFHardwareMonitor

- (void)hardwareStateDidChange
{
  swift_retain();
  sub_20A4D1464();
  swift_release();
}

- (_TtC17CoreODIEssentials20ODINFHardwareMonitor)init
{
  char *v3;
  uint64_t v4;
  objc_super v6;

  swift_defaultActor_initialize();
  v3 = (char *)self + OBJC_IVAR____TtC17CoreODIEssentials20ODINFHardwareMonitor_continuation;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545F9DC0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ODINFHardwareMonitor();
  return -[ODINFHardwareMonitor init](&v6, sel_init);
}

@end
