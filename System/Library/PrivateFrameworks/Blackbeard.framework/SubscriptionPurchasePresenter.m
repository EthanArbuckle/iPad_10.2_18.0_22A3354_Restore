@implementation SubscriptionPurchasePresenter

- (_TtC10Blackbeard29SubscriptionPurchasePresenter)init
{
  _TtC10Blackbeard29SubscriptionPurchasePresenter *result;

  result = (_TtC10Blackbeard29SubscriptionPurchasePresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10Blackbeard29SubscriptionPurchasePresenter_accountProvider);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  sub_236EA3DBC(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_2371F91D4);
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  sub_236EA3DBC(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_2371F9390);
}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  sub_236EA3DBC(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_2371F91D4);
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  sub_236EA3DBC(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_2371F9578);
}

@end
