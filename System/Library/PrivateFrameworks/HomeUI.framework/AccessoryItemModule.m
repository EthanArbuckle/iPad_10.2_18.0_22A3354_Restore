@implementation AccessoryItemModule

- (id)buildItemProviders
{
  _TtC6HomeUI19AccessoryItemModule *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1B8F082E8();

  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E930);
    sub_1B8E6DFF4();
    v4 = (void *)sub_1B93EE0D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v4;
  _TtC6HomeUI19AccessoryItemModule *v5;
  void *v6;

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B8E48724((unint64_t *)&qword_1ED57F920, (unint64_t *)&qword_1ED57F910);
  v4 = sub_1B93EE0FC();
  v5 = self;
  sub_1B8F08400(v4);

  swift_bridgeObjectRelease();
  sub_1B8E23A60(0, (unint64_t *)&unk_1ED57E910);
  v6 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC6HomeUI19AccessoryItemModule)initWithItemUpdater:(id)a3
{
  _TtC6HomeUI19AccessoryItemModule *result;

  swift_unknownObjectRetain();
  result = (_TtC6HomeUI19AccessoryItemModule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_1B8E6FE50(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC6HomeUI19AccessoryItemModule_itemProviderBlock));
}

@end
