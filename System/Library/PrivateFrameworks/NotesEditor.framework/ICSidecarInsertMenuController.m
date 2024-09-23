@implementation ICSidecarInsertMenuController

- (UIViewController)presentingViewController
{
  return (UIViewController *)sub_1DD9366A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICSidecarInsertMenuController_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  sub_1DD936740();
}

- (UIView)presentingSourceView
{
  return (UIView *)sub_1DD9366A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICSidecarInsertMenuController_presentingSourceView);
}

- (void)setPresentingSourceView:(id)a3
{
  sub_1DD936740();
}

- (CGRect)presentingSourceRect
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v2 = (double *)((char *)self + OBJC_IVAR___ICSidecarInsertMenuController_presentingSourceRect);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v6 = v2[3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setPresentingSourceRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (CGFloat *)((char *)self + OBJC_IVAR___ICSidecarInsertMenuController_presentingSourceRect);
  swift_beginAccess();
  *v7 = x;
  v7[1] = y;
  v7[2] = width;
  v7[3] = height;
}

- (ICSidecarInsertMenuController)init
{
  objc_class *ObjectType;
  uint64_t v3;
  ICSidecarInsertMenuController *v4;

  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for SidecarProvider();
  v3 = swift_allocObject();
  *(_BYTE *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = 0;
  *(_QWORD *)(v3 + 32) = 0;
  v4 = (ICSidecarInsertMenuController *)sub_1DD956C00(v3, (char *)objc_allocWithZone(ObjectType));
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  ICSidecarInsertMenuController *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_defaultCenter);
  objc_msgSend(v6, sel_removeObserver_, v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[ICSidecarInsertMenuController dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR___ICSidecarInsertMenuController_serviceProvider);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_release();
  sub_1DD8FE450(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICSidecarInsertMenuController_menuDidChange));
  sub_1DD8FE450(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICSidecarInsertMenuController_didReceiveItems));
}

- (id)menuDidChange
{
  return sub_1DD956170((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICSidecarInsertMenuController_menuDidChange, (uint64_t)sub_1DD7C0D48, (uint64_t)&block_descriptor_19);
}

- (void)setMenuDidChange:(id)a3
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
    v4 = sub_1DD9081FC;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___ICSidecarInsertMenuController_menuDidChange);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1DD8FE450(v7);
}

- (id)menu
{
  ICSidecarInsertMenuController *v2;
  void *inserted;

  v2 = self;
  inserted = (void *)SidecarInsertMenuController.menu()();

  return inserted;
}

- (void)cancel
{
  uint64_t v3;
  ICSidecarInsertMenuController *v4;

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = self;
  v4 = self;
  sub_1DD955E8C((void (*)(void))sub_1DD957624, v3);

  swift_release();
}

- (id)didReceiveItems
{
  return sub_1DD956170((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICSidecarInsertMenuController_didReceiveItems, (uint64_t)sub_1DD956288, (uint64_t)&block_descriptor_14);
}

- (void)setDidReceiveItems:(id)a3
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
    v4 = sub_1DD957170;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___ICSidecarInsertMenuController_didReceiveItems);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1DD8FE450(v7);
}

- (void)sidecarDevicesDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  ICSidecarInsertMenuController *v8;
  uint64_t v9;

  v4 = sub_1DD9D0538();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD9D0514();
  v8 = self;
  sub_1DD9569D0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
