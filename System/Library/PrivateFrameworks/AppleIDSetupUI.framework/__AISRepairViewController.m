@implementation __AISRepairViewController

- (BOOL)shouldAutoDismiss
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR_____AISRepairViewController_shouldAutoDismiss;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldAutoDismiss:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR_____AISRepairViewController_shouldAutoDismiss;
  swift_beginAccess();
  *v4 = a3;
}

- (__AISRepairViewController)initWithContext:(id)a3 reportHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  char *v12;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a3;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_236722308;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_2366FB220;
  *(_QWORD *)(v9 + 24) = v6;
  v10 = objc_allocWithZone((Class)type metadata accessor for RepairViewController());
  v11 = a3;
  v12 = RepairViewController.init(contextBuilder:reportHandler:)((uint64_t)sub_236721F24, v8, (uint64_t)sub_236722328, v9);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (__AISRepairViewController *)v12;
}

- (__AISRepairViewController)initWithCoder:(id)a3
{
  id v4;
  __AISRepairViewController *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR_____AISRepairViewController_shouldAutoDismiss) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR_____AISRepairViewController_hostingController) = 0;
  v4 = a3;

  result = (__AISRepairViewController *)sub_23673757C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  __AISRepairViewController *v2;

  v2 = self;
  sub_2367212B0();

}

- (__AISRepairViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  __AISRepairViewController *result;

  v4 = a4;
  result = (__AISRepairViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
