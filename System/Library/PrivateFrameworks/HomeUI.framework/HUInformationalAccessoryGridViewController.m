@implementation HUInformationalAccessoryGridViewController

- (NSSet)visibleAccessories
{
  _QWORD *v2;
  void *v3;

  v2 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR___HUInformationalAccessoryGridViewController_visibleAccessories);
  swift_beginAccess();
  if (!*v2)
    return (NSSet *)0;
  sub_1B8E23A60(0, (unint64_t *)&unk_1EF20D9E0);
  sub_1B8F55134();
  sub_1B93ECF74();
  v3 = (void *)sub_1B93EE0D8();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (void)setVisibleAccessories:(id)a3
{
  uint64_t v3;
  uint64_t *v5;
  HUInformationalAccessoryGridViewController *v6;

  v3 = (uint64_t)a3;
  if (a3)
  {
    sub_1B8E23A60(0, (unint64_t *)&unk_1EF20D9E0);
    sub_1B8F55134();
    v3 = sub_1B93EE0FC();
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___HUInformationalAccessoryGridViewController_visibleAccessories);
  swift_beginAccess();
  *v5 = v3;
  v6 = self;
  swift_bridgeObjectRelease();
  sub_1B8F540AC();

}

- (HUInformationalAccessoryGridViewController)init
{
  return -[HUInformationalAccessoryGridViewController initWithVisibleAccessories:](self, sel_initWithVisibleAccessories_, 0);
}

- (HUInformationalAccessoryGridViewController)initWithVisibleAccessories:(id)a3
{
  uint64_t v3;

  if (a3)
  {
    sub_1B8E23A60(0, (unint64_t *)&unk_1EF20D9E0);
    sub_1B8F55134();
    v3 = sub_1B93EE0FC();
  }
  else
  {
    v3 = 0;
  }
  return (HUInformationalAccessoryGridViewController *)InformationalAccessoryGridViewController.init(visibleAccessories:)(v3);
}

- (void)viewDidLoad
{
  HUInformationalAccessoryGridViewController *v2;

  v2 = self;
  sub_1B8F5478C();

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
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
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  HUInformationalAccessoryGridViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1B8F54944(v4);

  return v6;
}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  HUInformationalAccessoryGridViewController *v7;
  id v8;

  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_1B8F54AE0(a3, (uint64_t)a4);
  swift_unknownObjectRelease();

  return v8;
}

- (HUInformationalAccessoryGridViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5;
  id v6;
  HUInformationalAccessoryGridViewController *result;

  v5 = a3;
  v6 = a4;
  result = (HUInformationalAccessoryGridViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)initUsingCompositionalLayoutWithItemManager:(id)a3
{
  id v3;
  id result;

  v3 = a3;
  result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUInformationalAccessoryGridViewController_module));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUInformationalAccessoryGridViewController_moduleController));
}

@end
