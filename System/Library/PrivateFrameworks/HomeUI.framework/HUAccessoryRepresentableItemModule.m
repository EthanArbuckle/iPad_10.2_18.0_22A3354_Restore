@implementation HUAccessoryRepresentableItemModule

- (HUAccessoryRepresentableItemModule)initWithContext:(id)a3 in:(id)a4 itemUpdater:(id)a5
{
  id v9;
  id v10;

  swift_getObjectType();
  v9 = a3;
  v10 = a4;
  swift_unknownObjectRetain();
  return (HUAccessoryRepresentableItemModule *)sub_1B8F10218(v9, v10, (uint64_t)a5, (char *)self);
}

- (id)buildItemProviders
{
  uint64_t v3;
  void *v4;
  HUAccessoryRepresentableItemModule *v5;
  unint64_t v6;
  HUAccessoryRepresentableItemModule *v7;
  id v8;
  void *v9;

  v3 = MEMORY[0x1BCCC1DA8]((char *)self + OBJC_IVAR____TtC6HomeUI19AccessoryItemModule_home, a2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = self;
    v6 = sub_1B8F09DF8((uint64_t)v4);
    v7 = v5;
    v8 = sub_1B8F10398(v6, (uint64_t)v7);
    swift_bridgeObjectRelease();

    sub_1B8E93764((unint64_t)v8);
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E930);
  sub_1B8E6DFF4();
  v9 = (void *)sub_1B93EE0D8();
  swift_bridgeObjectRelease();
  return v9;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HUAccessoryRepresentableItemModule_accessoryItemProvider));
}

@end
