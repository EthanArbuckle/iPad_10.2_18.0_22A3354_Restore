@implementation NLRouterOverrideService

+ (BOOL)isEnabled
{
  return sub_21A32DA50() & 1;
}

- (_TtC13CDMFoundation23NLRouterOverrideService)init
{
  _TtC13CDMFoundation23NLRouterOverrideService *result;

  sub_21A32DAFC();
  OUTLINED_FUNCTION_60_0();
  return result;
}

- (void).cxx_destruct
{
  sub_21A32DC84(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CDMFoundation23NLRouterOverrideService_overridesStore), *(void **)&self->overridesStore[OBJC_IVAR____TtC13CDMFoundation23NLRouterOverrideService_overridesStore]);
  swift_bridgeObjectRelease();
  sub_21A2F75B0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CDMFoundation23NLRouterOverrideService_assetInfo), *(_QWORD *)&self->overridesStore[OBJC_IVAR____TtC13CDMFoundation23NLRouterOverrideService_assetInfo]);
}

@end
