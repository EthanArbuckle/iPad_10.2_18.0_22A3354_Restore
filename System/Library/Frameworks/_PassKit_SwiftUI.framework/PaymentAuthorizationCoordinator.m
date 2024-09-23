@implementation PaymentAuthorizationCoordinator

- (_TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator)init
{
  _TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator *result;

  result = (_TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_request));
  swift_release();
  sub_22D8CC6BC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onMerchantSessionRequested));
  sub_22D8CC6BC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onPaymentAuthorizationCompletion));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_activeWindow));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_underlyingCoordinator));
}

- (void)paymentAuthorizationControllerWillAuthorizePayment:(id)a3
{
  void (*v4)(_QWORD *);
  id v5;
  _TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator *v6;
  _QWORD v7[3];

  v4 = *(void (**)(_QWORD *))((char *)&self->super.isa
                                       + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onPaymentAuthorizationChange);
  memset(v7, 0, sizeof(v7));
  v5 = a3;
  v6 = self;
  v4(v7);

}

- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  void *v8;
  uint64_t v9;
  void (*v10)(_QWORD *);
  id v11;
  id v12;
  _TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator *v13;
  _QWORD v14[3];

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = *(void (**)(_QWORD *))((char *)&self->super.isa
                                        + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onPaymentAuthorizationChange);
  v14[0] = a4;
  v14[1] = sub_22D8DB770;
  v14[2] = v9;
  v11 = a3;
  v12 = a4;
  v13 = self;
  v10(v14);

  swift_release();
}

- (void)paymentAuthorizationControllerDidFinish:(id)a3
{
  id v4;
  _TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_22D8D8120();

}

- (void)paymentAuthorizationController:(PKPaymentAuthorizationController *)a3 didRequestMerchantSessionUpdate:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  PKPaymentAuthorizationController *v15;
  _TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA05D8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_22D8E70C4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_255DA06E0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_255DA06E8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_22D8DAA38((uint64_t)v9, (uint64_t)&unk_255DA06F0, (uint64_t)v14);
  swift_release();
}

- (void)paymentAuthorizationController:(PKPaymentAuthorizationController *)a3 didSelectPaymentMethod:(PKPaymentMethod *)a4 handler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  PKPaymentAuthorizationController *v17;
  PKPaymentMethod *v18;
  _TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA05D8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_22D8E70C4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_255DA06B8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_255DA06C0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_22D8DAA38((uint64_t)v11, (uint64_t)&unk_255DA06C8, (uint64_t)v16);
  swift_release();
}

- (void)paymentAuthorizationController:(PKPaymentAuthorizationController *)a3 didSelectShippingContact:(PKContact *)a4 handler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  PKPaymentAuthorizationController *v17;
  PKContact *v18;
  _TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA05D8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_22D8E70C4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_255DA0690;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_255DA0698;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_22D8DAA38((uint64_t)v11, (uint64_t)&unk_255DA06A0, (uint64_t)v16);
  swift_release();
}

- (void)paymentAuthorizationController:(PKPaymentAuthorizationController *)a3 didSelectShippingMethod:(PKShippingMethod *)a4 handler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  PKPaymentAuthorizationController *v17;
  PKShippingMethod *v18;
  _TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA05D8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_22D8E70C4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_255DA0668;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_255DA0670;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_22D8DAA38((uint64_t)v11, (uint64_t)&unk_255DA0678, (uint64_t)v16);
  swift_release();
}

- (void)paymentAuthorizationController:(PKPaymentAuthorizationController *)a3 didChangeCouponCode:(NSString *)a4 handler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  PKPaymentAuthorizationController *v17;
  NSString *v18;
  _TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA05D8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_22D8E70C4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_255DA05E8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_255DA05F8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_22D8DAA38((uint64_t)v11, (uint64_t)&unk_255DA0608, (uint64_t)v16);
  swift_release();
}

- (id)presentationWindowForPaymentAuthorizationController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_activeWindow));
}

@end
