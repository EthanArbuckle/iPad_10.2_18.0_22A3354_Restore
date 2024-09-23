@implementation SubscribeActionHandler

- (_TtC12NewsArticles22SubscribeActionHandler)init
{
  _TtC12NewsArticles22SubscribeActionHandler *result;

  result = (_TtC12NewsArticles22SubscribeActionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1B9FC02FC((uint64_t)self + OBJC_IVAR____TtC12NewsArticles22SubscribeActionHandler_actionModel);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles22SubscribeActionHandler_purchaseStarter);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles22SubscribeActionHandler_purchasingSpinnerViewControllerFactory);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NewsArticles22SubscribeActionHandler____lazy_storage___purchasingSpinnerViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NewsArticles22SubscribeActionHandler____lazy_storage___verifyingSpinnerViewController));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles22SubscribeActionHandler_tracker);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles22SubscribeActionHandler_router);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles22SubscribeActionHandler_familySharingLandingPageLauncher);
  swift_unknownObjectRelease();
  sub_1B9E30DEC((uint64_t)self + OBJC_IVAR____TtC12NewsArticles22SubscribeActionHandler_presenter);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles22SubscribeActionHandler_urlHandler);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles22SubscribeActionHandler_postPurchaseOnboardingManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles22SubscribeActionHandler_onboardingPrewarmer);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles22SubscribeActionHandler_paidBundleViaOfferFeatureAvailability);
}

- (void)handleSubscribeActionOnPresenter:(id)a3 inAppPurchaseIdKey:(id)a4 completionBlock:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  _TtC12NewsArticles22SubscribeActionHandler *v11;

  v8 = _Block_copy(a5);
  if (a4)
  {
    v9 = sub_1BA0BE840();
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  _Block_copy(v8);
  swift_unknownObjectRetain();
  v11 = self;
  sub_1B9FBED74(a3, v9, (uint64_t)a4, (uint64_t)v11, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)handleSubscribeActionOnPresenter:(id)a3 completionBlock:(id)a4
{
  void *v6;
  _TtC12NewsArticles22SubscribeActionHandler *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  swift_unknownObjectRetain();
  v7 = self;
  sub_1B9FBED74(a3, 0, 0, (uint64_t)v7, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_unknownObjectRelease();

}

- (void)handleAMSPurchaseCompletion
{
  uint64_t v3;
  void *v4;
  _TtC12NewsArticles22SubscribeActionHandler *v5;
  _TtC12NewsArticles22SubscribeActionHandler *v6;
  _TtC12NewsArticles22SubscribeActionHandler *v7;

  v3 = MEMORY[0x1BCCD5CF8]((char *)self + OBJC_IVAR____TtC12NewsArticles22SubscribeActionHandler_presenter, a2);
  if (v3)
  {
    v4 = (void *)v3;
    v7 = self;
    v5 = (_TtC12NewsArticles22SubscribeActionHandler *)objc_msgSend(v4, sel_controller);
    swift_unknownObjectRelease();
    if (v5)
    {
      -[SubscribeActionHandler dismissViewControllerAnimated:completion:](v5, sel_dismissViewControllerAnimated_completion_, 1, 0);

      v6 = v5;
    }
    else
    {
      v6 = v7;
    }

  }
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  id v4;
  _TtC12NewsArticles22SubscribeActionHandler *v5;

  v4 = a3;
  v5 = self;
  sub_1B9FC021C();

}

@end
