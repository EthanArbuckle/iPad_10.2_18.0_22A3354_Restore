@implementation HUActivityLogItemModule

- (HUActivityLogItemModule)initWithHome:(id)a3 itemUpdater:(id)a4
{
  id v5;
  HUActivityLogItemModule *v6;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = (HUActivityLogItemModule *)sub_1B8F419A8(v5, (uint64_t)a4);

  swift_unknownObjectRelease();
  return v6;
}

- (HUActivityLogItemModule)initWithItemUpdater:(id)a3
{
  HUActivityLogItemModule *result;

  swift_unknownObjectRetain();
  sub_1B93EE828();
  swift_bridgeObjectRelease();
  result = (HUActivityLogItemModule *)sub_1B93EE9CC();
  __break(1u);
  return result;
}

- (id)buildItemProviders
{
  HUActivityLogItemModule *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1B8F40E60();

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
  HUActivityLogItemModule *v3;
  void *v4;

  v3 = self;
  sub_1B8F41B58();

  sub_1B8E23A60(0, (unint64_t *)&unk_1ED57E910);
  v4 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v4;
}

- (void).cxx_destruct
{

}

@end
