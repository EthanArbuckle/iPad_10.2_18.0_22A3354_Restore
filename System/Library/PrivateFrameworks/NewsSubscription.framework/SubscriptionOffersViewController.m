@implementation SubscriptionOffersViewController

- (_TtC16NewsSubscription32SubscriptionOffersViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BA325CA0();
}

- (_TtC16NewsSubscription32SubscriptionOffersViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16NewsSubscription32SubscriptionOffersViewController *result;

  v4 = a4;
  result = (_TtC16NewsSubscription32SubscriptionOffersViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_styler);
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_purchasingSpinnerViewControllerFactory);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController____lazy_storage___verificationSpinner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController____lazy_storage___purchasingSpinner));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_purchasePresenter);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_purchaseController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_subscriptionOffersView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_renderer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_layoutAttributesFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_viewModelFactory);
  swift_bridgeObjectRelease();
  sub_1BA326160(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_viewModel));
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_webOptinFlowManager);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[SubscriptionOffersViewController viewDidAppear:](&v4, sel_viewDidAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC16NewsSubscription32SubscriptionOffersViewController *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = sub_1BA435FE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19.receiver = self;
  v19.super_class = ObjectType;
  v11 = self;
  -[SubscriptionOffersViewController viewDidDisappear:](&v19, sel_viewDidDisappear_, v3);
  v12 = *(Class *)((char *)&v11->super.super.super.isa
                 + OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_eventHandler);
  sub_1BA435FD4();
  v13 = sub_1BA435FC8();
  v15 = v14;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  v12[4] = v13;
  v12[5] = v15;
  swift_bridgeObjectRelease();
  v16 = v12 + 13;
  v17 = v12[16];
  v18 = v12[17];
  __swift_project_boxed_opaque_existential_1(v16, v17);
  (*(void (**)(uint64_t, uint64_t))(v18 + 16))(v17, v18);

}

- (void)viewDidLoad
{
  _TtC16NewsSubscription32SubscriptionOffersViewController *v2;

  v2 = self;
  sub_1BA3242D4();

}

- (void)viewWillLayoutSubviews
{
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  objc_super v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  v12.receiver = self;
  v12.super_class = (Class)swift_getObjectType();
  v2 = (char *)v12.receiver;
  -[SubscriptionOffersViewController viewWillLayoutSubviews](&v12, sel_viewWillLayoutSubviews);
  v3 = &v2[OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_viewModel];
  v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_viewModel];
  if (v4)
  {
    v5 = *((_QWORD *)v3 + 1);
    v6 = *((_QWORD *)v3 + 2);
    v7 = *((_QWORD *)v3 + 3);
    v8 = *((_QWORD *)v3 + 4);
    v9 = *((_QWORD *)v3 + 5);
    v10 = v3[48];
    v13 = *(_QWORD *)&v2[OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_viewModel];
    v14 = v5 & 1;
    v15 = v6;
    v16 = v7;
    v17 = v8;
    v18 = v9;
    v19 = v10 & 1;
    v11 = *(_QWORD *)&v2[OBJC_IVAR____TtC16NewsSubscription32SubscriptionOffersViewController_tag];
    if (v11)
    {
      sub_1BA326128(v4);
      swift_unknownObjectRetain();
      sub_1BA324A5C((uint64_t)&v13, v11);
      swift_unknownObjectRelease();
      sub_1BA326160(v4);
    }
  }

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[SubscriptionOffersViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  sub_1BA436DFC();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v7.receiver;
  -[SubscriptionOffersViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1BA325D7C();

}

- (void)cancelButtonTapped
{
  -[SubscriptionOffersViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

@end
