@implementation PaywallViewController

- (_TtC16NewsSubscription21PaywallViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BA36204C();
}

- (void)viewDidLoad
{
  _TtC16NewsSubscription21PaywallViewController *v2;

  v2 = self;
  PaywallViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType();
  v4 = v11.receiver;
  -[PaywallViewController viewWillAppear:](&v11, sel_viewWillAppear_, v3);
  v5 = (uint64_t)v4 + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_viewProvider;
  swift_beginAccess();
  sub_1BA2F8BB0(v5, (uint64_t)v8);
  v6 = v9;
  v7 = v10;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v7 + 48))(v6, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC16NewsSubscription21PaywallViewController *v4;

  v4 = self;
  PaywallViewController.viewDidAppear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC16NewsSubscription21PaywallViewController *v4;

  v4 = self;
  PaywallViewController.viewDidDisappear(_:)(a3);

}

- (void)viewWillLayoutSubviews
{
  id v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = v5.receiver;
  -[PaywallViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  sub_1BA2FC03C(0, (unint64_t *)&qword_1ED5C1C30, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEB940]);
  sub_1BA4369DC();
  sub_1BA2F299C(0, (unint64_t *)&qword_1ED5BE660);
  v3 = (void *)sub_1BA437F6C();
  *(_QWORD *)(swift_allocObject() + 16) = v2;
  type metadata accessor for CGSize(0);
  v4 = v2;
  sub_1BA4368D4();

  swift_release();
  swift_release();

  swift_release();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v10.receiver;
  -[PaywallViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  v6 = (uint64_t)v5 + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_viewProvider;
  swift_beginAccess();
  sub_1BA2F8BB0(v6, (uint64_t)v9);
  v7 = v9[4];
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  v8 = objc_msgSend(v5, sel_traitCollection);
  (*(void (**)(void))(v7 + 88))();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

- (void)handlePurchaseAddedNotificationWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC16NewsSubscription21PaywallViewController *v9;
  uint64_t v10;

  v4 = sub_1BA435D34();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA435D1C();
  v9 = self;
  sub_1BA35FC50();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (_TtC16NewsSubscription21PaywallViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16NewsSubscription21PaywallViewController *result;

  v4 = a4;
  result = (_TtC16NewsSubscription21PaywallViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[10];

  sub_1BA3110FC((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_delegate);
  sub_1BA3110FC((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_pluggableDelegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_viewProvider);
  swift_unknownObjectRelease();
  v3 = *(_OWORD *)((char *)&self->super._childModalViewControllers
                 + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_paywallModel);
  v8[6] = *(_OWORD *)((char *)&self->super._nibBundle
                    + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_paywallModel);
  v8[7] = v3;
  v4 = *(_OWORD *)((char *)&self->super._dimmingView
                 + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_paywallModel);
  v8[8] = *(_OWORD *)((char *)&self->super._previousRootViewController
                    + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_paywallModel);
  v8[9] = v4;
  v5 = *(_OWORD *)((char *)&self->super._tab + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_paywallModel);
  v8[2] = *(_OWORD *)((char *)&self->super._view + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_paywallModel);
  v8[3] = v5;
  v6 = *(_OWORD *)((char *)&self->super._title + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_paywallModel);
  v8[4] = *(_OWORD *)((char *)&self->super._navigationItem
                    + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_paywallModel);
  v8[5] = v6;
  v7 = *(_OWORD *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_paywallModel);
  v8[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_paywallModel);
  v8[1] = v7;
  sub_1BA310EC0((uint64_t)v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_layoutOptionsProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_purchasingSpinnerViewControllerFactory);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController____lazy_storage___verificationSpinner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController____lazy_storage___purchasingSpinner));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_purchasePresenter);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_sceneStateManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_webOptinFlowManager);
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription21PaywallViewController_personalizedPaywallDataService);
}

@end
