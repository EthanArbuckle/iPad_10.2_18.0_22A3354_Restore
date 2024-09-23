@implementation TextClock

- (_TtC18MobileTimerSupportP33_F15BF02653F44D6D9AC85F90DB61595B9TextClock)init
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  *(_QWORD *)&self->delegate[OBJC_IVAR____TtC18MobileTimerSupportP33_F15BF02653F44D6D9AC85F90DB61595B9TextClock_delegate] = 0;
  swift_unknownObjectWeakInit();
  v3 = (char *)self + OBJC_IVAR____TtC18MobileTimerSupportP33_F15BF02653F44D6D9AC85F90DB61595B9TextClock_overrideDate;
  v4 = sub_1B8DFD748();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = OBJC_IVAR____TtC18MobileTimerSupportP33_F15BF02653F44D6D9AC85F90DB61595B9TextClock__timeFormatterByOffset;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1E28A0);
  v6 = (objc_class *)swift_allocObject();
  type metadata accessor for MTSUnfairLock();
  v7 = swift_allocObject();
  *(_DWORD *)(v7 + 16) = 0;
  v8 = MEMORY[0x1E0DEE9E0];
  *((_QWORD *)v6 + 2) = v7;
  *((_QWORD *)v6 + 3) = v8;
  *(Class *)((char *)&self->super.isa + v5) = v6;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TextClock(0);
  return -[TextClock init](&v10, sel_init);
}

- (void)dealloc
{
  _TtC18MobileTimerSupportP33_F15BF02653F44D6D9AC85F90DB61595B9TextClock *v2;
  objc_super v3;

  v2 = self;
  sub_1B8DC2D00();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for TextClock(0);
  -[TextClock dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_1B8DA7528((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupportP33_F15BF02653F44D6D9AC85F90DB61595B9TextClock_delegate);
  sub_1B8D9D154((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupportP33_F15BF02653F44D6D9AC85F90DB61595B9TextClock_overrideDate, (uint64_t *)&unk_1ED36F800);
  swift_release();
}

- (void)timeFormatterTextDidChange:(id)a3
{
  _TtC18MobileTimerSupportP33_F15BF02653F44D6D9AC85F90DB61595B9TextClock *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1B8DC37A4(a3);

}

@end
