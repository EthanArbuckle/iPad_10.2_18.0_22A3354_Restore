@implementation JourneyDrivenOnboardingStep

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  sub_1004DC8AC(self, (int)a2, a3, a4, a5, (void (*)(id, void *))sub_1004DCFF0);
}

- (void)engagement:(id)a3 didUpdateEngagementRequest:(id)a4 placement:(id)a5 serviceType:(id)a6 completion:(id)a7
{
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  _TtC20ProductPageExtension27JourneyDrivenOnboardingStep *v21;

  v12 = _Block_copy(a7);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v15 = v14;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v18 = v17;
  v19 = a3;
  v20 = a4;
  v21 = self;
  sub_1004DD1F0(v19, a4, v13, v15, v16, v18);
  _Block_release(v12);

  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v18);
}

- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  sub_1004DC8AC(self, (int)a2, a3, a4, a5, (void (*)(id, void *))sub_1004DD420);
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  _TtC20ProductPageExtension27JourneyDrivenOnboardingStep *v18;

  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v12 = v11;
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v15 = v14;
  v16 = a3;
  v17 = a4;
  v18 = self;
  sub_1004DC938(v16, a4, v10, v12, v13, v15);

  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v15);
}

- (_TtC20ProductPageExtension27JourneyDrivenOnboardingStep)init
{
  _TtC20ProductPageExtension27JourneyDrivenOnboardingStep *result;

  result = (_TtC20ProductPageExtension27JourneyDrivenOnboardingStep *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.JourneyDrivenOnboardingStep", 48, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC20ProductPageExtension27JourneyDrivenOnboardingStep_bag));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27JourneyDrivenOnboardingStep_onboardingEngagement));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27JourneyDrivenOnboardingStep_engagementViewController));
}

@end
