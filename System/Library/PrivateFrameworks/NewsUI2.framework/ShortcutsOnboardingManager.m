@implementation ShortcutsOnboardingManager

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC7NewsUI226ShortcutsOnboardingManager *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI226ShortcutsOnboardingManager_userInfo);
  v5 = self;
  objc_msgSend(v4, sel_removeObserver_, v5);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[ShortcutsOnboardingManager dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (_TtC7NewsUI226ShortcutsOnboardingManager)init
{
  _TtC7NewsUI226ShortcutsOnboardingManager *result;

  result = (_TtC7NewsUI226ShortcutsOnboardingManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)userInfoDidChangeShortcutsOnboardingState:(id)a3
{
  id v4;
  _TtC7NewsUI226ShortcutsOnboardingManager *v5;

  v4 = a3;
  v5 = self;
  sub_1D6D69EE8();

}

@end
