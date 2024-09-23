@implementation PurchasingSpinnerViewController

- (_TtC16NewsSubscription31PurchasingSpinnerViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC16NewsSubscription31PurchasingSpinnerViewController *result;

  v5 = OBJC_IVAR____TtC16NewsSubscription31PurchasingSpinnerViewController_spinnerView;
  v6 = objc_allocWithZone((Class)type metadata accessor for PurchasingSpinnerView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC16NewsSubscription31PurchasingSpinnerViewController *)sub_1BA438260();
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = v6.receiver;
  -[PurchasingSpinnerViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
  PurchasingSpinner.label.getter();
  v5 = (void *)sub_1BA437C18();
  swift_bridgeObjectRelease();
  MEMORY[0x1BCCDBE90](v5);

}

- (void)viewWillLayoutSubviews
{
  _TtC16NewsSubscription31PurchasingSpinnerViewController *v2;

  v2 = self;
  PurchasingSpinnerViewController.viewWillLayoutSubviews()();

}

- (_TtC16NewsSubscription31PurchasingSpinnerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16NewsSubscription31PurchasingSpinnerViewController *result;

  v4 = a4;
  result = (_TtC16NewsSubscription31PurchasingSpinnerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription31PurchasingSpinnerViewController_viewStyler);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription31PurchasingSpinnerViewController_viewLayoutAttributesFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription31PurchasingSpinnerViewController_viewRenderer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription31PurchasingSpinnerViewController_spinnerView));
}

@end
