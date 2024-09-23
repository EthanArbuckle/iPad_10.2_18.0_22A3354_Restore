@implementation HomePodSetupAMSUpsellViewController

- (void)viewDidLoad
{
  _TtC14HDSViewService35HomePodSetupAMSUpsellViewController *v2;

  v2 = self;
  sub_1000551C4();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t Strong;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HomePodSetupAMSUpsellViewController(0);
  v4 = (char *)v7.receiver;
  -[HomePodSetupAMSUpsellViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC14HDSViewService35HomePodSetupAMSUpsellViewController_presenter]);
  if (Strong)
  {
    v6 = Strong;
    sub_10006EB30();

    swift_unknownObjectRelease(v6);
  }
  else
  {

  }
}

- (_TtC14HDSViewService35HomePodSetupAMSUpsellViewController)initWithContentView:(id)a3
{
  id v3;
  __n128 v4;
  __n128 v5;
  __n128 v6;
  __n128 v7;
  _TtC14HDSViewService35HomePodSetupAMSUpsellViewController *result;

  v3 = a3;
  result = (_TtC14HDSViewService35HomePodSetupAMSUpsellViewController *)_swift_stdlib_reportUnimplementedInitializer("HDSViewService.HomePodSetupAMSUpsellViewController", 50, "init(contentView:)", 18, 0, v4, v5, v6, v7);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000113B8((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService35HomePodSetupAMSUpsellViewController_presenter]);
  sub_10001486C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService35HomePodSetupAMSUpsellViewController_viewModel]);

}

- (void)dynamicViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  _TtC14HDSViewService35HomePodSetupAMSUpsellViewController *v11;

  if (a4)
    v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v8 = 0;
  v9 = a3;
  v10 = a5;
  v11 = self;
  sub_1000562AC(v9, v8, (uint64_t)a5);

  swift_bridgeObjectRelease(v8);
}

@end
