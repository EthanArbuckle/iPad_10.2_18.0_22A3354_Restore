@implementation PaywallFormatContentService

- (_TtC16NewsSubscription27PaywallFormatContentService)init
{
  _TtC16NewsSubscription27PaywallFormatContentService *result;

  result = (_TtC16NewsSubscription27PaywallFormatContentService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _BYTE v3[528];

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27PaywallFormatContentService_formatService);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27PaywallFormatContentService_resourceService);
  swift_bridgeObjectRelease();
  sub_1BA362F40((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27PaywallFormatContentService_paywallConfig, (uint64_t)v3, (unint64_t *)&unk_1ED5C07B0, (uint64_t)&type metadata for PaywallConfig);
  sub_1BA384C44((uint64_t)v3);
}

- (void)configurationManagerPaywallConfigDidChange:(id)a3
{
  _TtC16NewsSubscription27PaywallFormatContentService *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1BA37F804();
  swift_unknownObjectRelease();

}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  id v4;
  _TtC16NewsSubscription27PaywallFormatContentService *v5;

  v4 = a3;
  v5 = self;
  sub_1BA385DE4();

}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  id v4;
  _TtC16NewsSubscription27PaywallFormatContentService *v5;

  v4 = a3;
  v5 = self;
  sub_1BA37F804();

}

@end
