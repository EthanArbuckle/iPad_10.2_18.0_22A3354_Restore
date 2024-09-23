@implementation IMBApplePayManager

- (BCApplePayManagerDelegate)delegate
{
  char *v2;
  _BYTE v4[24];

  v2 = (char *)self + OBJC_IVAR____TtC8Business18IMBApplePayManager_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Business18IMBApplePayManager_delegate, v4, 0, 0);
  return (BCApplePayManagerDelegate *)(id)swift_unknownObjectWeakLoadStrong(v2);
}

- (void)setDelegate:(id)a3
{
  char *v4;
  _BYTE v5[24];

  v4 = (char *)self + OBJC_IVAR____TtC8Business18IMBApplePayManager_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Business18IMBApplePayManager_delegate, v5, 1, 0);
  swift_unknownObjectWeakAssign(v4, a3);
}

- (id)message
{
  _TtC8Business18IMBApplePayManager *v2;
  id v3;

  v2 = self;
  v3 = IMBApplePayManager.message()();

  return v3;
}

- (int64_t)applePayStatus
{
  _TtC8Business18IMBApplePayManager *v2;
  int64_t v3;

  v2 = self;
  v3 = IMBApplePayManager.applePayStatus()();

  return v3;
}

- (void)presentApplePayWithWindow:(id)a3
{
  id v5;
  _TtC8Business18IMBApplePayManager *v6;
  _TtC8Business18IMBApplePayManager *v7;
  UIWindow_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.super.super.isa = (Class)a3;
  IMBApplePayManager.presentApplePay(with:)(v8);

}

- (void)extendApplePayTimeout
{
  _TtC8Business18IMBApplePayManager *v2;

  v2 = self;
  sub_1000246D4();

}

- (void)handlePaymentAuthorizationRetryWithTimer:(id)a3
{
  id v4;
  _TtC8Business18IMBApplePayManager *v5;

  v4 = a3;
  v5 = self;
  sub_10002482C(v4);

}

- (_TtC8Business18IMBApplePayManager)init
{
  _TtC8Business18IMBApplePayManager *result;

  result = (_TtC8Business18IMBApplePayManager *)_swift_stdlib_reportUnimplementedInitializer("Business.IMBApplePayManager", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100011A64((uint64_t)self + OBJC_IVAR____TtC8Business18IMBApplePayManager_delegate);
  sub_100010C40((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Business18IMBApplePayManager_httpClientFactory));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Business18IMBApplePayManager_messagePaymentRequest));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Business18IMBApplePayManager_applePayViewModel));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Business18IMBApplePayManager_authorizePaymentRetryTimer));
  sub_100028980(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Business18IMBApplePayManager_paymentAuthorizedCompletion), *(_QWORD *)&self->delegate[OBJC_IVAR____TtC8Business18IMBApplePayManager_paymentAuthorizedCompletion]);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Business18IMBApplePayManager_paymentAuthorizationController));

}

- (void)paymentAuthorizationControllerDidFinish:(id)a3
{
  id v4;
  _TtC8Business18IMBApplePayManager *v5;

  v4 = a3;
  v5 = self;
  IMBApplePayManager.paymentAuthorizationControllerDidFinish(_:)((PKPaymentAuthorizationController)v4);

}

- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC8Business18IMBApplePayManager *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_100025B30(v9, v10, (char *)v11, v8);
  _Block_release(v8);

}

- (void)paymentAuthorizationController:(id)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5
{
  sub_100026C88(self, (int)a2, a3, a4, a5, (SEL *)&selRef_debugDescription, "BusinessChat: paymentAuthorizationController: %@, didSelectPaymentMethod: %@", 76, (void (*)(void *, uint64_t, void *))sub_100029B98);
}

- (void)paymentAuthorizationController:(id)a3 didSelectShippingMethod:(id)a4 handler:(id)a5
{
  sub_100026C88(self, (int)a2, a3, a4, a5, (SEL *)&selRef_description, "BusinessChat: paymentAuthorizationController: %@, didSelectShippingMethod: %@", 77, (void (*)(void *, uint64_t, void *))sub_10002A364);
}

- (void)paymentAuthorizationController:(id)a3 didSelectShippingContact:(id)a4 handler:(id)a5
{
  sub_100026C88(self, (int)a2, a3, a4, a5, (SEL *)&selRef_description, "BusinessChat: paymentAuthorizationController: %@, didSelectShippingContact: %@", 78, (void (*)(void *, uint64_t, void *))sub_10002ADF4);
}

- (id)presentationWindowForPaymentAuthorizationController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC8Business18IMBApplePayManager_window));
}

@end
