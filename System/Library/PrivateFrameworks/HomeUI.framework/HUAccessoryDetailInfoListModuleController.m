@implementation HUAccessoryDetailInfoListModuleController

- (id)init:(id)a3
{
  char *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (char *)self + OBJC_IVAR___HUAccessoryDetailInfoListModuleController_delegate;
  v6 = (objc_class *)type metadata accessor for AccessoryDetailInfoListModuleController();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[HUItemModuleController initWithModule:](&v8, sel_initWithModule_, a3);
}

- (Class)cellClassForItem:(id)a3
{
  sub_1B8FB4A58();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for AccessoryDetailInfoListModuleController();
  v6 = a3;
  v7 = a4;
  v8 = v12.receiver;
  -[HUItemModuleController setupCell:forItem:](&v12, sel_setupCell_forItem_, v6, v7);
  objc_opt_self();
  v9 = swift_dynamicCastObjCClass();
  if (v9)
  {
    v10 = (void *)v9;
    v11 = v6;
    objc_msgSend(v10, sel_setHideIcon_, 1, v12.receiver, v12.super_class);
    objc_msgSend(v10, sel_setAccessoryType_, 4);

    v7 = v8;
    v8 = v11;
  }

}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  HUAccessoryDetailInfoListModuleController *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_1B8FB4B8C(v8, v9, a5);

}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  HUAccessoryDetailInfoListModuleController *v5;

  v4 = a3;
  v5 = self;
  sub_1B8FB4FE0((uint64_t)v4);

  return 0;
}

- (void)accessoryButtonTappedForItem:(id)a3
{
  id v4;
  HUAccessoryDetailInfoListModuleController *v5;

  v4 = a3;
  v5 = self;
  sub_1B8FB50F4((uint64_t)v4);

}

- (HUAccessoryDetailInfoListModuleController)initWithModule:(id)a3
{
  id v3;
  HUAccessoryDetailInfoListModuleController *result;

  v3 = a3;
  result = (HUAccessoryDetailInfoListModuleController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B8E26870((uint64_t)self + OBJC_IVAR___HUAccessoryDetailInfoListModuleController_delegate, &qword_1EF20DB40);
}

@end
