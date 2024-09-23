@implementation MedicationsRoutingDetailViewController

- (_TtC26MedicationsHealthAppPlugin38MedicationsRoutingDetailViewController)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC26MedicationsHealthAppPlugin38MedicationsRoutingDetailViewController *result;

  v4 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin38MedicationsRoutingDetailViewController_context;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC26MedicationsHealthAppPlugin38MedicationsRoutingDetailViewController *)sub_2318D6150();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MedicationsRoutingDetailViewController();
  v2 = v3.receiver;
  -[MedicationsRoutingDetailViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_2317E6EDC();

}

- (_TtC26MedicationsHealthAppPlugin38MedicationsRoutingDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC26MedicationsHealthAppPlugin38MedicationsRoutingDetailViewController *result;

  v4 = a4;
  result = (_TtC26MedicationsHealthAppPlugin38MedicationsRoutingDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2317E82B0((uint64_t)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin38MedicationsRoutingDetailViewController_context, (unint64_t *)&qword_255F255F0, (void (*)(uint64_t))sub_2317E812C);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin38MedicationsRoutingDetailViewController_healthStore));
  sub_2317D4B2C((uint64_t)self+ OBJC_IVAR____TtC26MedicationsHealthAppPlugin38MedicationsRoutingDetailViewController_pinnedContentManager);
}

@end
