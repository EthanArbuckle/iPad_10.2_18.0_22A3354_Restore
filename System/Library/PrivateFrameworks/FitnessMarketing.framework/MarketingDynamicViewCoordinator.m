@implementation MarketingDynamicViewCoordinator

- (_TtC16FitnessMarketing31MarketingDynamicViewCoordinator)init
{
  _TtC16FitnessMarketing31MarketingDynamicViewCoordinator *result;

  result = (_TtC16FitnessMarketing31MarketingDynamicViewCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23C1CF99C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onDismiss));
  sub_23C1CF99C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onPurchase));
  sub_23C1CF99C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onCarrierLink));
}

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  sub_23C1D60E4(self, (uint64_t)a2, a3, a4, a5, &OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onDismiss, (void (*)(_QWORD, uint64_t))sub_23C1CF980, (void (*)(_QWORD, uint64_t))sub_23C1CF99C);
}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  sub_23C1D60E4(self, (uint64_t)a2, a3, a4, a5, &OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onPurchase, (void (*)(_QWORD, uint64_t))sub_23C1CF980, (void (*)(_QWORD, uint64_t))sub_23C1CF99C);
}

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
  sub_23C1D60E4(self, (uint64_t)a2, a3, a4, a5, &OBJC_IVAR____TtC16FitnessMarketing31MarketingDynamicViewCoordinator_onCarrierLink, (void (*)(_QWORD, uint64_t))sub_23C1D6580, (void (*)(_QWORD, uint64_t))sub_23C1D6584);
}

@end
