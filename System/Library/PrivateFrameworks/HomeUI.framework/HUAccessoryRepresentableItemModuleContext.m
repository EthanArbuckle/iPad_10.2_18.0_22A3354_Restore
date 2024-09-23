@implementation HUAccessoryRepresentableItemModuleContext

- (unint64_t)objectLevel
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_objectLevel);
  swift_beginAccess();
  return *v2;
}

- (void)setObjectLevel:(unint64_t)a3
{
  unint64_t *v4;

  v4 = (unint64_t *)((char *)self + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_objectLevel);
  swift_beginAccess();
  *v4 = a3;
}

- (HFAccessoryLikeObjectContainer)accessoryContainer
{
  swift_beginAccess();
  return (HFAccessoryLikeObjectContainer *)(id)swift_unknownObjectRetain();
}

- (void)setAccessoryContainer:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_accessoryContainer);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (int64_t)sectionGroupingType
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_sectionGroupingType);
  swift_beginAccess();
  return *v2;
}

- (void)setSectionGroupingType:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_sectionGroupingType);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)hideSourceItemDescriptions
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_hideSourceItemDescriptions;
  swift_beginAccess();
  return *v2;
}

- (void)setHideSourceItemDescriptions:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_hideSourceItemDescriptions;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)showFooter
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_showFooter;
  swift_beginAccess();
  return *v2;
}

- (void)setShowFooter:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_showFooter;
  swift_beginAccess();
  *v4 = a3;
}

- (HFCharacteristicValueSource)valueSource
{
  swift_beginAccess();
  return (HFCharacteristicValueSource *)(id)swift_unknownObjectRetain();
}

- (void)setValueSource:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_valueSource);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (id)filter
{
  return sub_1B8F0AD84((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_filter, (uint64_t)sub_1B8F0A070, (uint64_t)&block_descriptor_35);
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
    v4 = sub_1B8F11310;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_filter);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1B8E6FE50(v7);
}

- (id)itemFilter
{
  return sub_1B8F0AD84((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_itemFilter, (uint64_t)sub_1B8F0AE9C, (uint64_t)&block_descriptor_11);
}

- (void)setItemFilter:(id)a3
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
    v4 = sub_1B8F11310;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_itemFilter);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1B8E6FE50(v7);
}

- (HUAccessoryRepresentableItemModuleContext)init
{
  return (HUAccessoryRepresentableItemModuleContext *)AccessoryRepresentableItemModule.Context.init()();
}

- (HUAccessoryRepresentableItemModuleContext)initWithObjectLevel:(unint64_t)a3 accessoryContainer:(id)a4 sectionGroupingType:(int64_t)a5 hideSourceItemDescriptions:(BOOL)a6 showFooter:(BOOL)a7 valueSource:(id)a8 filter:(id)a9 itemFilter:(id)a10
{
  void *v15;
  uint64_t (*v16)();
  uint64_t (*v17)();
  uint64_t v18;
  uint64_t (*v19)();
  uint64_t v20;
  HUAccessoryRepresentableItemModuleContext *v21;

  v15 = _Block_copy(a9);
  v16 = (uint64_t (*)())_Block_copy(a10);
  v17 = v16;
  if (!v15)
  {
    v19 = 0;
    v18 = 0;
    if (v16)
      goto LABEL_3;
LABEL_5:
    v20 = 0;
    goto LABEL_6;
  }
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v15;
  v19 = sub_1B8F11200;
  if (!v17)
    goto LABEL_5;
LABEL_3:
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v17;
  v17 = sub_1B8F11310;
LABEL_6:
  swift_getObjectType();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v21 = (HUAccessoryRepresentableItemModuleContext *)sub_1B8F10F84(a3, (uint64_t)a4, a5, a6, a7, (uint64_t)a8, (uint64_t)v19, v18, (uint64_t)v17, v20, self);
  sub_1B8E6FE50((uint64_t)v17);
  sub_1B8E6FE50((uint64_t)v19);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v21;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1B8E6FE50(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_filter));
  sub_1B8E6FE50(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___HUAccessoryRepresentableItemModuleContext_itemFilter));
}

@end
