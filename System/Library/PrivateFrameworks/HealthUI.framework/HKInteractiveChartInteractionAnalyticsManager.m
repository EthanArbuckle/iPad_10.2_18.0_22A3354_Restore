@implementation HKInteractiveChartInteractionAnalyticsManager

- (_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager)initWithHealthStore:(id)a3
{
  id v3;
  _TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager *v4;

  v3 = a3;
  v4 = (_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager *)sub_1D7AAE7D8(v3);

  return v4;
}

- (void)submitWithEvent:(id)a3
{
  void *v3;
  uint64_t ObjectType;
  uint64_t v7;
  void *v8;
  id v9;
  _TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager *v10;
  _QWORD v11[6];

  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager_submissionManager);
  if (v3)
  {
    ObjectType = swift_getObjectType();
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = ObjectType;
    v11[4] = sub_1D7AAEB08;
    v11[5] = v7;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 1107296256;
    v11[2] = sub_1D7AAE5D0;
    v11[3] = &block_descriptor_7;
    v8 = _Block_copy(v11);
    v9 = a3;
    v10 = self;
    swift_release();
    objc_msgSend(v3, sel_submitEvent_completion_, v9, v8);
    _Block_release(v8);

  }
}

- (_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager)init
{
  _TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager *result;

  result = (_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager_submissionManager));
}

@end
