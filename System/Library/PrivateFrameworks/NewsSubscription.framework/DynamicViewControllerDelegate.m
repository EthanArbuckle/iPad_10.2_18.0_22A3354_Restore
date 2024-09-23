@implementation DynamicViewControllerDelegate

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
  sub_1BA42ECA4(self, (uint64_t)a2, a3, a4, a5, sub_1BA42E3FC);
}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  sub_1BA42ECA4(self, (uint64_t)a2, a3, a4, a5, sub_1BA42E964);
}

- (BOOL)dynamicViewControllerShouldDismiss:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC16NewsSubscription29DynamicViewControllerDelegate *v6;

  v4 = qword_1ED5C0D38;
  v5 = a3;
  v6 = self;
  if (v4 != -1)
    swift_once();
  sub_1BA437F30();
  sub_1BA436AA8();
  sub_1BA42F1F8((uint64_t)v5);

  return 1;
}

- (_TtC16NewsSubscription29DynamicViewControllerDelegate)init
{
  _TtC16NewsSubscription29DynamicViewControllerDelegate *result;

  result = (_TtC16NewsSubscription29DynamicViewControllerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BA3000D8((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_purchaseContext, (uint64_t (*)(_QWORD))sub_1BA3090BC);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_router);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_postPurchaseOnboardingManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription29DynamicViewControllerDelegate_paidBundleViaOfferHandler);
}

@end
