@implementation WalkingSteadinessAnalyticsOnboardingEventDataSource

- (id)stepWithError:(id *)a3
{
  id result;

  __asm { BR              X10 }
  return result;
}

- (id)featureVersionWithError:(id *)a3
{
  void *v3;

  sub_1D77F4DE8();
  v3 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)provenanceWithError:(id *)a3
{
  void *v3;

  swift_bridgeObjectRetain();
  v3 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)activeWatchProductTypeWithError:(id *)a3
{
  void *v4;
  _TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource *v5;
  id v6;
  void *v7;

  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_activeWatchProductType);
  sub_1D77F4AE8();

  v7 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  return v7;
}

- (id)hasDefaultHeightWithError:(id *)a3
{
  _TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource *v4;
  void *v5;

  v4 = self;
  v5 = (void *)sub_1D77D44B0(a3);

  return v5;
}

- (id)hasDefaultWeightWithError:(id *)a3
{
  _TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource *v4;
  void *v5;

  v4 = self;
  v5 = (void *)sub_1D77D45BC(a3);

  return v5;
}

- (id)acceptDefaultHeightWithError:(id *)a3
{
  _TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource *v4;
  void *v5;

  v4 = self;
  v5 = (void *)sub_1D77D46C8(a3);

  return v5;
}

- (id)acceptDefaultWeightWithError:(id *)a3
{
  _TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource *v4;
  void *v5;

  v4 = self;
  v5 = (void *)sub_1D77D47D8(a3);

  return v5;
}

- (id)acceptDefaultNotificationsWithError:(id *)a3
{
  void *v3;

  if (*((_BYTE *)&self->super.isa
       + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_onboardingStep) == 3
    && *((_BYTE *)&self->super.isa
       + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_acceptDefaults) != 2)
  {
    v3 = (void *)sub_1D77F4B6C();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)ageWithError:(id *)a3
{
  _TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource *v4;
  id v5;

  v4 = self;
  v5 = sub_1D77D4980(a3);

  return v5;
}

- (id)biologicalSexWithError:(id *)a3
{
  _TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource *v4;
  id v5;

  v4 = self;
  v5 = sub_1D77D4A04(a3);

  return v5;
}

- (_TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource)init
{
  _TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource *result;

  result = (_TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_healthStore));
  swift_bridgeObjectRelease();
}

@end
