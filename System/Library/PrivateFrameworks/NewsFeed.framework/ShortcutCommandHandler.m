@implementation ShortcutCommandHandler

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC8NewsFeed22ShortcutCommandHandler *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed22ShortcutCommandHandler_shortcutList);
  v5 = self;
  objc_msgSend(v4, sel_removeObserver_, v5);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[ShortcutCommandHandler dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22ShortcutCommandHandler_shortcutManager);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22ShortcutCommandHandler_featureAvailability);
  swift_unknownObjectRelease();
  sub_1BA8FD860((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22ShortcutCommandHandler_commandCenter);
}

- (_TtC8NewsFeed22ShortcutCommandHandler)init
{
  _TtC8NewsFeed22ShortcutCommandHandler *result;

  result = (_TtC8NewsFeed22ShortcutCommandHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)shortcutList:(id)a3 didAddShortcuts:(id)a4 changedShortcuts:(id)a5 removedShortcuts:(id)a6
{
  uint64_t v8;
  id v9;
  _TtC8NewsFeed22ShortcutCommandHandler *v10;

  if (MEMORY[0x1BCCE5D40]((char *)self + OBJC_IVAR____TtC8NewsFeed22ShortcutCommandHandler_commandCenter, a2, a3, a4, a5, a6))
  {
    swift_getObjectType();
    v8 = qword_1ED3C4C60;
    v9 = a3;
    v10 = self;
    if (v8 != -1)
      swift_once();
    sub_1BB86FF1C();

    swift_unknownObjectRelease();
  }
}

@end
