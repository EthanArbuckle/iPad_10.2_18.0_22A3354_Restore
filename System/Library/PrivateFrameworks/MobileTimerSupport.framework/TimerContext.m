@implementation TimerContext

- (_TtC18MobileTimerSupport12TimerContext)initWithState:(int64_t)a3 timerId:(id)a4 duration:(double)a5 remainingTime:(double)a6 firing:(BOOL)a7 fireDate:(id)a8 title:(id)a9
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED36F800);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1B8DFDB68();
  v19 = v18;
  if (a8)
  {
    sub_1B8DFD718();
    v20 = sub_1B8DFD748();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v16, 0, 1, v20);
  }
  else
  {
    v21 = sub_1B8DFD748();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v16, 1, 1, v21);
  }
  v22 = sub_1B8DFDB68();
  return (_TtC18MobileTimerSupport12TimerContext *)TimerContext.init(state:timerId:duration:remainingTime:firing:fireDate:title:)(a3, v17, v19, a7, (uint64_t)v16, v22, v23, a5, a6);
}

- (NSString)description
{
  return (NSString *)sub_1B8D95BC8(self, (uint64_t)a2, (void (*)(void))sub_1B8D90600);
}

- (_TtC18MobileTimerSupport12TimerContext)init
{
  _TtC18MobileTimerSupport12TimerContext *result;

  result = (_TtC18MobileTimerSupport12TimerContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1B8D9D154((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport12TimerContext_firedDate, (uint64_t *)&unk_1ED36F800);
  sub_1B8D9D154((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport12TimerContext_fireDate, (uint64_t *)&unk_1ED36F800);
  sub_1B8D9D154((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport12TimerContext_dismissedDate, (uint64_t *)&unk_1ED36F800);
  swift_bridgeObjectRelease();
}

@end
