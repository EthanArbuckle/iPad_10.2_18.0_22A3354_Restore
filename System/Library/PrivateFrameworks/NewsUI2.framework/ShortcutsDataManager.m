@implementation ShortcutsDataManager

- (void)dealloc
{
  objc_class *ObjectType;
  unint64_t *v4;
  unint64_t v5;
  _TtC7NewsUI220ShortcutsDataManager *v6;
  _QWORD v7[4];
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (unint64_t *)(*__swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC7NewsUI220ShortcutsDataManager_shortcutsService), *(_QWORD *)&self->shortcutsService[OBJC_IVAR____TtC7NewsUI220ShortcutsDataManager_shortcutsService])+ OBJC_IVAR____TtC7NewsUI216ShortcutsService_observers);
  swift_beginAccess();
  v5 = *v4;
  v7[2] = self;
  v7[3] = &off_1E9B522D8;
  v6 = self;
  swift_bridgeObjectRetain();
  *v4 = (unint64_t)sub_1D5F07984((uint64_t (*)(uint64_t *))sub_1D6D87D2C, v7, v5);

  swift_bridgeObjectRelease();
  v8.receiver = v6;
  v8.super_class = ObjectType;
  -[ShortcutsDataManager dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI220ShortcutsDataManager_delegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220ShortcutsDataManager_shortcutsService);

  swift_release();
}

- (_TtC7NewsUI220ShortcutsDataManager)init
{
  _TtC7NewsUI220ShortcutsDataManager *result;

  result = (_TtC7NewsUI220ShortcutsDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
