@implementation UtilityDetailsViewController

- (_TtC6HomeUI28UtilityDetailsViewController)initWithHome:(id)a3 details:(id)a4
{
  objc_class *v6;
  id v7;
  objc_super v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF20A740);
  v6 = (objc_class *)sub_1B93EDD00();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6HomeUI28UtilityDetailsViewController_home) = (Class)a3;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6HomeUI28UtilityDetailsViewController_details) = v6;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for UtilityDetailsViewController();
  v7 = a3;
  return -[UtilityDetailsViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
}

- (_TtC6HomeUI28UtilityDetailsViewController)initWithCoder:(id)a3
{
  type metadata accessor for UtilityDetailsViewController();
  swift_deallocPartialClassInstance();
  return 0;
}

- (void)viewDidLoad
{
  _TtC6HomeUI28UtilityDetailsViewController *v2;

  v2 = self;
  sub_1B8EAA8F4();

}

- (_TtC6HomeUI28UtilityDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6HomeUI28UtilityDetailsViewController *result;

  v4 = a4;
  result = (_TtC6HomeUI28UtilityDetailsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
