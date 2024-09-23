@implementation HUActionSetItemModule

+ (NSString)actionSetSectionIdentifier
{
  return (NSString *)(id)sub_1B93EDD84();
}

- (unint64_t)actionSetItemStyle
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR___HUActionSetItemModule_actionSetItemStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setActionSetItemStyle:(unint64_t)a3
{
  unint64_t *v4;

  v4 = (unint64_t *)((char *)self + OBJC_IVAR___HUActionSetItemModule_actionSetItemStyle);
  swift_beginAccess();
  *v4 = a3;
}

- (HMHome)home
{
  return (HMHome *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                           + OBJC_IVAR___HUActionSetItemModule_home));
}

- (id)filter
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUActionSetItemModule_filter);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B8F0AE9C;
  aBlock[3] = &block_descriptor_18_1;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setFilter:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1B8F11200;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___HUActionSetItemModule_filter);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1B8E6FE50(v7);
}

- (id)sortBlock
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD aBlock[6];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___HUActionSetItemModule_sortBlock);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  aBlock[4] = v3;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B8FEF240;
  aBlock[3] = &block_descriptor_12_4;
  v5 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v5;
}

- (void)setSortBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___HUActionSetItemModule_sortBlock);
  swift_beginAccess();
  *v6 = sub_1B8FF0CE8;
  v6[1] = (uint64_t (*)())v5;
  swift_release();
}

- (HFActionSetItemProvider)actionSetItemProvider
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___HUActionSetItemModule_actionSetItemProvider);
  swift_beginAccess();
  return (HFActionSetItemProvider *)*v2;
}

- (void)setActionSetItemProvider:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR___HUActionSetItemModule_actionSetItemProvider);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (HUActionSetItemModule)initWithItemUpdater:(id)a3
{
  swift_unknownObjectRetain();
  sub_1B8FF00CC();
}

- (HUActionSetItemModule)initWithHome:(id)a3 itemUpdater:(id)a4
{
  _QWORD *v6;
  BOOL (**v7)(void *, void *);
  id v8;
  objc_super v10;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUActionSetItemModule_actionSetItemStyle) = 0;
  v6 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUActionSetItemModule_filter);
  *v6 = 0;
  v6[1] = 0;
  v7 = (BOOL (**)(void *, void *))((char *)self + OBJC_IVAR___HUActionSetItemModule_sortBlock);
  *v7 = sub_1B8FEF0F4;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUActionSetItemModule_actionSetItemProvider) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUActionSetItemModule_home) = (Class)a3;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ActionSetItemModule();
  v8 = a3;
  return -[HFItemModule initWithItemUpdater:](&v10, sel_initWithItemUpdater_, a4);
}

- (id)buildItemProviders
{
  HUActionSetItemModule *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1B8FEF6D8();

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
  HUActionSetItemModule *v4;
  void *v5;

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B8E34E3C();
  sub_1B93EE0FC();
  v4 = self;
  sub_1B8FEF988();

  swift_bridgeObjectRelease();
  sub_1B8E23A60(0, (unint64_t *)&unk_1ED57E910);
  v5 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v5;
}

- (void).cxx_destruct
{

  sub_1B8E6FE50(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___HUActionSetItemModule_filter));
  swift_release();

}

@end
