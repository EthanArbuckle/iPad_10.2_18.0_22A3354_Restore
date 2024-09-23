@implementation ServiceGroupEditorItemManager

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  _TtC6HomeUI29ServiceGroupEditorItemManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1B901ED40();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E930);
  v6 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)_buildItemModulesForHome:(id)a3
{
  id v4;
  _TtC6HomeUI29ServiceGroupEditorItemManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1B901DFDC(v4);

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57E900);
  v6 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  _TtC6HomeUI29ServiceGroupEditorItemManager *v4;
  void *v5;

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B8E48724((unint64_t *)&qword_1ED57F920, (unint64_t *)&qword_1ED57F910);
  sub_1B93EE0FC();
  v4 = self;
  sub_1B901E1C8();

  swift_bridgeObjectRelease();
  sub_1B8E23A60(0, (unint64_t *)&unk_1ED57E910);
  v5 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v5;
}

- (id)_homeFuture
{
  uint64_t v3;
  void *v4;
  _TtC6HomeUI29ServiceGroupEditorItemManager *v5;
  id v6;
  id v7;

  v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_selectionController);
  swift_beginAccess();
  v4 = *(void **)(v3 + 16);
  v5 = self;
  v6 = objc_msgSend(v4, sel_home);
  v7 = objc_msgSend((id)objc_opt_self(), sel_futureWithResult_, v6);

  return v7;
}

- (_TtC6HomeUI29ServiceGroupEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  id v5;
  _TtC6HomeUI29ServiceGroupEditorItemManager *result;

  swift_unknownObjectRetain();
  v5 = a4;
  result = (_TtC6HomeUI29ServiceGroupEditorItemManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_nameAndIconItem));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_accessoryElementItemModule));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_staticItemProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6HomeUI29ServiceGroupEditorItemManager_accessoryElementContext));
}

@end
