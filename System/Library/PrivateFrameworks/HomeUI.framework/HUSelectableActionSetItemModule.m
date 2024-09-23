@implementation HUSelectableActionSetItemModule

- (NSString)sceneSectionHeaderTitle
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___HUSelectableActionSetItemModule_sceneSectionHeaderTitle;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  sub_1B93ECF74();
  v3 = (void *)sub_1B93EDD84();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setSceneSectionHeaderTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_1B93EDDB4();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___HUSelectableActionSetItemModule_sceneSectionHeaderTitle);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (id)buildItemProviders
{
  HUSelectableActionSetItemModule *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1B8ED63A8();

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
  HUSelectableActionSetItemModule *v4;
  void *v5;

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B8E34E3C();
  sub_1B93EE0FC();
  v4 = self;
  sub_1B8ED669C();

  swift_bridgeObjectRelease();
  sub_1B8E23A60(0, (unint64_t *)&unk_1ED57E910);
  v5 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v5;
}

- (HUSelectableActionSetItemModule)initWithHome:(id)a3 itemUpdater:(id)a4
{
  id v5;
  HUSelectableActionSetItemModule *v6;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = (HUSelectableActionSetItemModule *)sub_1B8ED6F94(v5, (uint64_t)a4);

  swift_unknownObjectRelease();
  return v6;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

@end
