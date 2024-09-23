@implementation InterruptionMonitor

- (void)dealloc
{
  _TtC19ContactlessReaderUI19InterruptionMonitor *v2;
  objc_super v3;

  v2 = self;
  sub_22F894D90(0);
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for InterruptionMonitor();
  -[InterruptionMonitor dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_22F8847A8((uint64_t)self + OBJC_IVAR____TtC19ContactlessReaderUI19InterruptionMonitor_delegate);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19ContactlessReaderUI19InterruptionMonitor_hardwareButtonConsumer));
  v3 = (char *)self + OBJC_IVAR____TtC19ContactlessReaderUI19InterruptionMonitor__interruption;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E1EDE0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (_TtC19ContactlessReaderUI19InterruptionMonitor)init
{
  _TtC19ContactlessReaderUI19InterruptionMonitor *result;

  result = (_TtC19ContactlessReaderUI19InterruptionMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  id v6;
  id v7;
  _TtC19ContactlessReaderUI19InterruptionMonitor *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22F8955FC(v7);

}

- (void)consumeDoublePressUpForButtonKind:(int64_t)a3
{
  sub_22F895C9C(a3);
}

@end
