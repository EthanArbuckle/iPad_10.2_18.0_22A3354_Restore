@implementation SelectableItemModuleController

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  _TtC6HomeUI30SelectableItemModuleController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8EC5680(v6, (uint64_t)v7);

}

- (BOOL)canSelectItem:(id)a3
{
  id v4;
  _TtC6HomeUI30SelectableItemModuleController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1B8EC5A00((uint64_t)v4);

  return self & 1;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  _TtC6HomeUI30SelectableItemModuleController *v5;

  v4 = a3;
  v5 = self;
  sub_1B8EC5E9C((uint64_t)v4);

  return 0;
}

- (_TtC6HomeUI30SelectableItemModuleController)initWithModule:(id)a3
{
  objc_super v6;

  *(HUItemModuleControllerHosting **)((char *)&self->super._host
                                    + OBJC_IVAR____TtC6HomeUI30SelectableItemModuleController_delegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SelectableItemModuleController();
  return -[HUItemModuleController initWithModule:](&v6, sel_initWithModule_, a3);
}

- (void).cxx_destruct
{
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR____TtC6HomeUI30SelectableItemModuleController_delegate);
}

@end
