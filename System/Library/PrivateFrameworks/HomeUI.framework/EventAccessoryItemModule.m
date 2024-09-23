@implementation EventAccessoryItemModule

- (id)buildItemProviders
{
  _TtC6HomeUI24EventAccessoryItemModule *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1B8FBFF2C();
  v4 = v3;

  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57E930);
    sub_1B8E7A214((unint64_t *)&qword_1ED57E940, (uint64_t *)&unk_1ED57E930);
    v5 = (void *)sub_1B93EE0D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (_TtC6HomeUI24EventAccessoryItemModule)initWithContext:(id)a3 in:(id)a4 itemUpdater:(id)a5
{
  id v9;
  id v10;

  swift_getObjectType();
  v9 = a3;
  v10 = a4;
  swift_unknownObjectRetain();
  return (_TtC6HomeUI24EventAccessoryItemModule *)sub_1B8F10218(v9, v10, (uint64_t)a5, (char *)self);
}

@end
