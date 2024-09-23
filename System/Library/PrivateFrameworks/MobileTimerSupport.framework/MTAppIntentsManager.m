@implementation MTAppIntentsManager

- (_TtC18MobileTimerSupport19MTAppIntentsManager)init
{
  objc_super v4;

  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MTAppIntentsManager();
  return -[MTAppIntentsManager init](&v4, sel_init);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

+ (_TtC18MobileTimerSupport19MTAppIntentsManager)sharedManager
{
  if (qword_1ED36ED78 != -1)
    swift_once();
  return (_TtC18MobileTimerSupport19MTAppIntentsManager *)(id)qword_1ED36ED70;
}

- (_TtP18MobileTimerSupport27MTAppIntentsManagerDelegate_)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC18MobileTimerSupport19MTAppIntentsManager_delegate;
  swift_beginAccess();
  return (_TtP18MobileTimerSupport27MTAppIntentsManagerDelegate_ *)(id)MEMORY[0x1BCCBD264](v2);
}

- (void)didSelectTabWithTab:(int64_t)a3
{
  _TtC18MobileTimerSupport19MTAppIntentsManager *v4;

  v4 = self;
  sub_1B8DDE900(a3);

}

- (void)didAddNewWorldClockWithName:(id)a3
{
  sub_1B8DDEC44(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1B8DDEAD0);
}

- (void)didRemoveWorldClockWithName:(id)a3
{
  sub_1B8DDEC44(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1B8DDEAF8);
}

- (void).cxx_destruct
{
  sub_1B8DA7528((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport19MTAppIntentsManager_delegate);
}

@end
