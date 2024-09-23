@implementation AccessoryDetailsSuggestedAutomationsViewController

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = sub_1B93EB900();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  sub_1B9009B50();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)viewDidLayoutSubviews
{
  _TtC6HomeUI50AccessoryDetailsSuggestedAutomationsViewController *v2;

  v2 = self;
  sub_1B9009F50();

}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  _TtC6HomeUI50AccessoryDetailsSuggestedAutomationsViewController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1B900A1F4(v4);

  return v6;
}

- (_TtC6HomeUI50AccessoryDetailsSuggestedAutomationsViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  id v4;
  _TtC6HomeUI50AccessoryDetailsSuggestedAutomationsViewController *result;

  v4 = a3;
  result = (_TtC6HomeUI50AccessoryDetailsSuggestedAutomationsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6HomeUI50AccessoryDetailsSuggestedAutomationsViewController_home));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6HomeUI50AccessoryDetailsSuggestedAutomationsViewController_triggerModuleController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC6HomeUI50AccessoryDetailsSuggestedAutomationsViewController_viewCoordinator);
}

@end
