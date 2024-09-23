@implementation HUInstructionItemModule

- (id)buildItemProviders
{
  HUInstructionItemModule *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1B8E96B98();

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
  HUInstructionItemModule *v3;
  void *v4;

  v3 = self;
  sub_1B8E96F20();

  sub_1B8E23A60(0, (unint64_t *)&unk_1ED57E910);
  v4 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v4;
}

- (HUInstructionItemModule)initWithItemUpdater:(id)a3
{
  HUInstructionItemModule *result;

  swift_unknownObjectRetain();
  result = (HUInstructionItemModule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
