@implementation TextClock

- (_TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock)init
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  *(_QWORD *)&self->delegate[OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock_delegate] = 0;
  swift_unknownObjectWeakInit();
  v3 = (char *)self + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock_overrideDate;
  v4 = sub_237EE1D70();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock__timeFormatterByOffset;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689C1B8);
  v6 = (objc_class *)swift_allocObject();
  type metadata accessor for CPUnfairLock();
  v7 = swift_allocObject();
  *(_DWORD *)(v7 + 16) = 0;
  v8 = MEMORY[0x24BEE4B00];
  *((_QWORD *)v6 + 2) = v7;
  *((_QWORD *)v6 + 3) = v8;
  *(Class *)((char *)&self->super.isa + v5) = v6;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TextClock(0);
  return -[TextClock init](&v10, sel_init);
}

- (void)dealloc
{
  _TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock *v2;
  objc_super v3;

  v2 = self;
  sub_237EA49FC();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for TextClock(0);
  -[TextClock dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_237E74BBC((uint64_t)self + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock_delegate);
  sub_237E2209C((uint64_t)self + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock_overrideDate, &qword_25689C140);
  swift_release();
}

- (void)timeFormatterTextDidChange:(id)a3
{
  _TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_237EA54E8(a3);

}

@end
